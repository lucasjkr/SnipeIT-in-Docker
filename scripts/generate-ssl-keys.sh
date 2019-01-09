SNIPEHOME="$( cd "$(dirname "$0")" ; pwd -P )"/../

openssl req -x509 -newkey rsa:4086 -days 3650 -nodes -sha256\
  -keyout "${SNIPEHOME}/opt/nginx-key.pem" \
  -out "${SNIPEHOME}/opt/nginx-cert.pem" \
  -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=ElkStack" \
