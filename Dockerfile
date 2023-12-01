FROM ubuntu
RUN apt update -y
RUN apt install systemctl -y
RUN apt install nginx -y
ADD . /var/www/html
CMD apachectl -D FOREGROUND
