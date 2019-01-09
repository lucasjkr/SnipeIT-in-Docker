#/bin/sh
SNIPEHOME="$( cd "$(dirname "$0")" ; pwd -P )"/../
mkdir -p ${SNIPEHOME}/opt/
cp ~/snipe-security-backup/* ${SNIPEHOME}/opt/
