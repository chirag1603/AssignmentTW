FROM ubuntu 
COPY . /usr/home
RUN cd /usr/home/ && apt-get update -y && apt-get install unzip -y && unzip static.zip
#ENTRYPOINT ["sleep.sh"]
CMD tail -f /dev/null
