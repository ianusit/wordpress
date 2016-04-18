FROM ianusit/nginx-php-mysql:1.0

MAINTAINER Ianus IT GmbH <info@ianus-it.de>

RUN apk add --update wget zip ca-certificates &&\ 
    wget --no-check-certificate https://de.wordpress.org/latest-de_DE.zip &&\
    wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar &&\
    mv wp-cli.phar /usr/local/bin/wp &&\
    unzip latest-de_DE.zip &&\
    rm latest-de_DE.zip &&\
    mv wordpress/* /web &&\
    rm -r wordpress &&\
    chown -R nginx:www-data /web &&\
    apk del zip &&\
    rm -rf /var/cache/apk/* 
    
CMD ["/start.sh"]
