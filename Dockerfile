FROM ubuntu/apache2
RUN apt update -y
RUN apt install systemctl -y
ADD . /var/www/html

