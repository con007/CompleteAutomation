FROM centos:7

RUN yum install java-1.8.0-openjdk -y
RUN yum install curl -y
RUN yum install git -y
RUN yum install httpd -y 

COPY /var/www/index.php /var/www/html/

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
