FROM ubuntu:14.04

RUN apt update && \ 
    apt -y install git

RUN git clone --depth=1 https://github.com/offensive-security/exploit-database.git && \
    ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]