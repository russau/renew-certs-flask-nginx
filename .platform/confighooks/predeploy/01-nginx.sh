#!/bin/bash
# do this every time a config deploy happens
# if we are confgured with a CERT_DOMAIN
#  - put the ssl.conf into place
if [[ ! -z "${CERT_DOMAIN}" ]]
then
    sed "s/CERT_DOMAIN/${CERT_DOMAIN}/g" /var/proxy/staging/nginx/conf.d/https.conf.pre > /var/proxy/staging/nginx/conf.d/https.conf
fi