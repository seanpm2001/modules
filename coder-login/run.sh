#!/usr/bin/env sh

# Automatically authenticate the user if they are not
# logged in to another deployment

# CODER_DEPLOYMENT_URL=("${CODER_DEPLOYMENT_URL}")
# CODER_USER_TOKEN=("${CODER_USER_TOKEN}")
RESET='\033[0m'
BOLD='\033[0;1m'

printf "$${BOLD}Logging into Coder...\n\n$${RESET}"

# if command -v coder >/dev/null 2>&1; then
#   echo "Coder installed"
# else
#   echo "Installing coder..."
#   curl -L https://coder.com/install.sh | sh
# fi

if ! coder list >/dev/null 2>&1; then
  set +x; coder login --token="${CODER_USER_TOKEN}" --url="${CODER_DEPLOYMENT_URL}"
else
  echo "You are already authenticated with coder."
fi
