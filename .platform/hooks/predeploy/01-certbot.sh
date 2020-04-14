#!/bin/bash
# if we are confgured with a CERT_DOMAIN
#  - put the ssl.conf into place
#  - install certbot and route53 dns plugin
#  - if the cert was created restart apache
if [[ ! -z "${CERT_DOMAIN}" ]]
then
    sed "s/CERT_DOMAIN/${CERT_DOMAIN}/g" /var/proxy/staging/nginx/conf.d/https.conf.pre > /var/proxy/staging/nginx/conf.d/https.conf
    pip3 install certbot_dns_route53
    /usr/local/bin/certbot certonly --dns-route53 \
      -d ${CERT_DOMAIN} \
      --register-unsafely-without-email \
      --agree-tos \
      --keep-until-expiring
fi