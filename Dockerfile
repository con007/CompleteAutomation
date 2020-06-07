FROM ubuntu:16.04

RUN apt install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN echo 'root:dock123' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN apt install java-1.8.0-openjdk -y
RUN apt install curl -y
RUN apt install git -y
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN cp ./kubectl /usr/local/bin/kubectl
RUN mv ./kubectl /usr/bin/kubectl

CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22

