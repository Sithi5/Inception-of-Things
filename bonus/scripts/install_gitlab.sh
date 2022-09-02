sudo localedef -v -c -i en_US -f UTF-8 en_US.UTF-8

# colors
DARK_GREEN='\e[0;32m'
END='\e[0;m'

echo "${DARK_GREEN}[DISABLE FIREWALL] : DISABLE FIREWALL...${END}"

# peut régler certains soucis de ssh etc => c'est évidemment pas une bonne pratique mais ici ça nous permet de contourner des migraines
systemctl disable firewalld --now

echo "${DARK_GREEN}[INSTALL GITLAB - CURL] : CURL...${END}"

# lien pour téléchager notre gitlab
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash

echo "${DARK_GREEN}[INSTALL GITLAB - INSTALL] : GITLAB-CE...${END}"

# on installe le fichier qu'on vient de curl => en version CE
yum -y install gitlab-ce

echo "${DARK_GREEN}[EXTERNAL URL SET UP] : SETTING UP...${END}"

# Afin d'accéder à notre gitlab depuis notre machine, on vient créer une url externe
# config.vm.network "forwarded_port", guest: 8181, host: 8181, protocol: "tcp" => lié à ce paramètrage dans notre vagrantfile
# il suffit de cat /etc/gitlab/gitlab.rb en cas d'erreur pour vérifier que la commande est passée
# on met en paramètre notre IP instanciée en amont sur notre vagrantfile, ainsi que le port XXXX de guest 
sudo sed -i 's|external_url \x27http://gitlab.example.com\x27|external_url \x27http://192.168.56.10:8181\x27|g' /etc/gitlab/gitlab.rb 

echo "${DARK_GREEN}[GITLAB.RB RECONFIGUE] : CONFIG...${END}"

# nécessité de reconfigurer notre gitlab afin qu'il prenne en compte la modif
sudo gitlab-ctl reconfigure

# sudo gitlab-ctl restart
# sudo gitlab-rake cache:clear => en cas de soucis on peut redémarrer et vider le cache de notre .rb, ça peut parfois bloquer la reconfiguration qu'on a besoin de faire

echo "${DARK_GREEN}[PASSWORD] : CAT PASSWORD...${END}"
# afin de se connecter à notre gitlab, on a besoin du mdp associé à notre user : root
sudo cat /etc/gitlab/initial_root_password