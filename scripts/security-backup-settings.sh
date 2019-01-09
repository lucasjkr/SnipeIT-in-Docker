#/bin/sh
SNIPEHOME="$( cd "$(dirname "$0")" ; pwd -P )"/../
mkdir -p ~/snipe-security-backup
cp ${SNIPEHOME}/opt/* ~/snipe-security-backup
