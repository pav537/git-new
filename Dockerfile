FROM ubuntu
RUN apt update -y
RUN apt install systemctl
RUN apt install apache2 -y
ADD . /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
