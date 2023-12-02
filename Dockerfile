FROM ubuntu
RUN apt update -y
RUN apt install systemctl -y
RUN apt install apache2 -y
RUN systemctl start apache2
ADD . /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
