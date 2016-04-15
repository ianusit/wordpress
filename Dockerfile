FROM ianusit/nginx-php-mysql:1.0

MAINTAINER Ianus IT GmbH <info@ianus-it.de>

RUN apk add -update wget zip &&\ 
    cd /web &&\
    wget https://de.wordpress.org/latest-de_DE.zip &&\
    unzip latest-de_DE.zip &&\
    rm latest-de_DE.zip &&\
    cd .. &&\
    chown -R nginx:www-data /web
    
CMD ["/start.sh"]
