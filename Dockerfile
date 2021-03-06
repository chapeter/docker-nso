FROM ubuntu
RUN apt-get update && apt-get install -y python openssl ssh ant
RUN apt-get install -y python-pip
RUN apt-get install -y vim gawk
RUN pip install --upgrade pip
RUN pip install paramiko
RUN pip install ansible

COPY . /tmp
WORKDIR /tmp
RUN mkdir build

EXPOSE 2024
EXPOSE 2022
EXPOSE 8080

CMD run.sh
