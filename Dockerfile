FROM library/debian:stretch
MAINTAINER kenneth@floss.cat

RUN     apt-get update && \
        apt-get --no-install-recommends -y install libapache2-mod-php7.0 && \
        rm -f /var/www/html/*.html && \
        rm -rf /var/lib/apt/cache && \
        rm -rf /usr/share/doc && \
        rm -rf /usr/share/man && \
        mkdir -p var/log/apache2/ && \
        ln -sf /dev/stdout /var/log/apache2/access.log && \
        ln -sf /dev/sterr /var/log/apache2/error.log
COPY    index.html      /var/www/html

EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]
