FROM ubuntu
RUN apt-get upgrade && apt-get update && apt-get install -y python3 python3-pip
COPY requirements.txt /tmp
WORKDIR /tmp
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

