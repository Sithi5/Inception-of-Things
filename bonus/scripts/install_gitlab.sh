#/bin/sh

# colors
DARK_GREEN='\e[0;32m'
END='\e[0;m'


echo "${DARK_GREEN}[UPADTE AND INSTALL] :  DEPENDENCIES..${END}"

sudo apt update
sudo apt install -y curl openssh-server ca-certificates tzdata perl
sudo apt install -y postfix

echo "${DARK_GREEN}[INSTALL] :  INSTALL GITLAB...${END}"

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="https://gitlab.example.com" apt install gitlab-ce

echo "${DARK_GREEN}[PASSWORD] : ${END}"

cat /etc/gitlab/initial_root_password 