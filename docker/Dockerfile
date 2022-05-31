FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
LABEL maintainer="sblive@outlook.com"

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install apache2 mariadb-server php php-mysql libapache2-mod-php php-xml php-mbstring
RUN apt-get -y install php-apcu php-intl imagemagick inkscape php-gd php-cli php-curl php-bcmath git
RUN apt-get -y install wget
RUN apt-get -y install php-json
RUN apt-get install -y vim

WORKDIR /var/www/html
RUN wget https://releases.wikimedia.org/mediawiki/1.37/mediawiki-1.37.0.tar.gz

RUN tar -xvzf /var/www/html/mediawiki-*.tar.gz
RUN mkdir /var/lib/mediawiki && mv mediawiki-*/* /var/lib/mediawiki
RUN ln -s /var/lib/mediawiki /var/www/html/mediawiki

RUN mysqld_safe --skip-grant-tables --skip-networking &

RUN phpenmod mbstring
RUN phpenmod xml

EXPOSE 80
EXPOSE 443

CMD ["apachectl","-D","FOREGROUND"]