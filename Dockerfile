FROM docker.io/centos:7.7.1908

WORKDIR /app

COPY ./gin-web /app/gin-web

RUN ls -al

RUN yum clean all \
 && yum install epel-release -y \
 && yum install golang -y

WORKDIR /app/gin-web

RUN go build .

EXPOSE 8080

RUN chmod 777 start.sh

CMD ./start.sh
