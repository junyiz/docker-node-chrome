FROM centos:latest
VOLUME ["/var/yum/cache"]

WORKDIR /root

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install wget && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && \
    yum -y install ./google-chrome-stable_current_x86_64.rpm

RUN sed -i '86,146d' /etc/fonts/fonts.conf

RUN wget https://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-x64.tar.gz && \
    tar zxf node-v8.11.4-linux-x64.tar.gz

ENV NODE_PATH /root/node-v8.11.4-linux-x64/lib/node_modules
ENV PATH /root/node-v8.11.4-linux-x64/bin:$PATH

RUN google-chrome --version
RUN node --version
RUN npm --version
