FROM centos:7

RUN yum install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:dock123' | chpasswd
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "FOREGROUND"]


RUN yum install java-1.8.0-openjdk -y
RUN yum install curl -y
RUN yum install git -y
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN mv ./kubectl /usr/bin/kubectl

RUN yum install httpd -y 
RUN mkdir -p /var/www
RUN touch /var/www/index.php
COPY index.php /var/www/html/

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
