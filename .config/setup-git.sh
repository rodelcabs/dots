# assuming install.sh has been executed and all necessary package has been installed
# install git
brew install git

# setup credentials
brew install --cask git-credential-manager

# setup gpg keys
brew install gpg gpg-agent

# generate new key with gpg
gpg --full-generate-key

# get generated key
gpg_command_return="$(gpg --list-secret-keys --keyid-format=long | grep 'sec')"
extractedKeyId=${gpg_command_return#*/}
IFS=' '
array=($extractedKeyId)
keyId="${array[0]}"

#export the public key
echo "EXPORTING PUBLIC KEY.."
gpg --armor --export "${keyId}"
echo "!! PLEASE COPY PUBLIC KEY AND PASTE TO GIHUB !!"
