#!/bin/bash

DARK_GREEN='\e[0;32m'

END='\e[0;m'

echo -e "${DARK_GREEN}INSTALL K3S MASTER NODE...${END}"
curl -sfL https://get.k3s.io | sh -

echo -e "${DARK_GREEN}CHECK SERVICE...${END}"
systemctl status k3s