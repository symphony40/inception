FROM debian:latest
RUN apt update && apt upgrade && apt install -y \
nginx openssl
EXPOSE 443
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
    -keyout /etc/ssl/private/vejurick.key \
    -out /etc/ssl/certs/vejurick.crt \
    -subj="/C=MA/ST=khouribga/L=khouribga/O=1337 School/OU=vejurick/CN=vejurick.42.fr"

COPY ./tools/certs.sh /tmp/certs.sh

RUN chmod +x /tmp/certs.sh

COPY default /etc/nginx/sites-available/.

ENTRYPOINT ["/tmp/certs.sh"]

CMD ["nginx", "-g", "daemon off;"]