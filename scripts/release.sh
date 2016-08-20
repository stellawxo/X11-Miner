#!/bin/bash

set -e

SRC_ROOT="$(git rev-parse --show-toplevel)"

source $SRC_ROOT/.env

VERSION=1.0.7 # Manually change the version when new binaries are available
GITHUB_USER=PinIdea
GITHUB_REPO=ASIC-X11-Miner
PROJECT_URL="git@github.com:${GITHUB_USER}/${GITHUB_REPO}"
GITHUB_RELEASE_NAME="PinIdea ASIC X11 Miner DR-1/DU-1 v$VERSION"

function display {
  echo "⛏  $1"
  echo
}

function checkError {
  if [[ "$?" -ne 0 ]]; then
    echo "😡  $1"
    exit 1
  fi
}

command -v git > /dev/null 2>&1
checkError "You obviously need git, please consider installing it..."

command -v github-release > /dev/null 2>&1
checkError "github-release is not installed, go get -u github.com/aktau/github-release or check https://github.com/aktau/github-release, aborting."

command -v openssl > /dev/null 2>&1
checkError "You need openssl to generate binaries signature, brew install it, aborting."

GITHUB_VERSION="v${VERSION}"
RELEASE_DIR="$(git rev-parse --show-toplevel)/release-${VERSION}"
GITHUB_RELEASE_FILE="github-release-${VERSION}.md"

LAST_RELEASE_VERSION=$(git describe --tags $(git rev-list --tags --max-count=1))
checkError "Unable to find current version tag"


display "Starting release from ${LAST_RELEASE_VERSION} to ${GITHUB_VERSION} on ${PROJECT_URL} with token ${GITHUB_TOKEN}"
if [[ "${GITHUB_USER}" == "PinIdea" ]]; then
    display "THIS IS A REAL RELEASE, on OFFICIAL PinIdea REPO"
fi

while true; do
    read -p "⛏   Do you want to proceed with this release? (y/n) > " yn
    echo ""
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "😡   Please answer yes or no.";;
    esac
done

if [[ -d "${RELEASE_DIR}" ]]; then
  display "Cleaning up ${RELEASE_DIR}"
  rm -rdf "${RELEASE_DIR}"
  checkError "Can't clean up ${RELEASE_DIR}. You should do it manually and retry"
fi

mkdir -p "${RELEASE_DIR}"
checkError "Can't create ${RELEASE_DIR}, aborting"

display "Preparing for new release ${VERSION}"
cd "${RELEASE_DIR}" && \
zip -r -X cgminer-dr1-pi.zip ../bin/pi_cgminer && \
zip -r -X cgminer-dr1-win.zip ../bin/win_cgminer && \
zip -r -X cgminer-dr1-ubuntu32.zip ../bin/ubuntu_32_cgminer && \
zip -r -X cgminer-dr1-ubuntu64.zip ../bin/ubuntu_64_cgminer 

display "Generating github release"
cp -f $(git rev-parse --show-toplevel)/scripts/templates/github-release-template.md "${GITHUB_RELEASE_FILE}"
checkError "Can't find github release template"

CHECKSUM=""
for file in $(ls ${RELEASE_DIR}/*.zip); do
  SHA256=$(openssl dgst -sha256 < "${file}")
  MD5=$(openssl dgst -md5 < "${file}")
  LINE=$(printf "\n * **%s**\n  * sha256 \`%s\`\n  * md5 \`%s\`\n\n" "$(basename ${file})" "${SHA256}" "${MD5}")
  CHECKSUM="${CHECKSUM}${LINE}"
done

TEMPLATE=$(cat "${GITHUB_RELEASE_FILE}")
echo "${TEMPLATE//\{\{VERSION\}\}/$GITHUB_VERSION}" > "${GITHUB_RELEASE_FILE}"
checkError "Couldn't replace [ ${GITHUB_VERSION} ]"


TEMPLATE=$(cat "${GITHUB_RELEASE_FILE}")
echo "${TEMPLATE//\{\{CHECKSUM\}\}/$CHECKSUM}" > "${GITHUB_RELEASE_FILE}"
checkError "Couldn't replace [ ${CHECKSUM} ]"

RELEASE_DOCUMENTATION="$(cat ${GITHUB_RELEASE_FILE})"

display "Tagging release on github"
git tag "${GITHUB_VERSION}"
git push --tags

display "Creating release on github"
github-release release \
    --security-token  "${GITHUB_TOKEN}" \
    --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_VERSION}" \
    --name "${GITHUB_RELEASE_NAME}" \
    --description "${RELEASE_DOCUMENTATION}" \
    --draft
checkError "Could not create release, aborting"

display "Uploading binaries"
for file in $(ls ${RELEASE_DIR}/*.zip); do
  display "Uploading ${file}..."
  github-release upload \
      --security-token  "${GITHUB_TOKEN}" \
      --user "${GITHUB_USER}" \
      --repo "${GITHUB_REPO}" \
      --tag "${GITHUB_VERSION}" \
      --name "$(basename "${file}")" \
      --file "${file}"
  if [[ "$?" -ne 0 ]]; then
    display "Could not upload ${file}, continuing with others"
  fi
done

rm ${GITHUB_RELEASE_FILE}

echo "There is a couple of tasks your still need to do manually:"
echo "  1. Open the release notes created for you on github https://github.com/${GITHUB_USER}/${GITHUB_REPO}/releases/tag/${GITHUB_VERSION}, you'll have a chance to enhance commit details a bit"
echo "  2. Once you're happy with your release notes on github, copy the list of changes to the CHANGELOG.md"
echo "  3. Update the documentation branch"
echo "  4. Test the binaries linked from the github release page"
echo "  5. Party !!"
echo
echo "The full details of these tasks are described in the RELEASE-NOTES.md document, available at https://github.com/${GITHUB_USER}/${GITHUB_REPO}/blob/master/RELEASE-NOTES.md"

