FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server && apt-get install openjdk-8-jre -y
RUN mkdir -p /var/run/sshd
RUN echo 'root:dock123' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN apt install curl -y
RUN apt install git -y
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN cp ./kubectl /usr/local/bin/kubectl
RUN mv ./kubectl /usr/bin/kubectl

CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22

