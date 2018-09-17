# specify the node base image with your desired version node:<version>
FROM node:8

RUN npm -g install nrm \
    && nrm use taobao \
    && npm -g install npm \
    && npm -g install cnpm


COPY ./entrypoint.sh /root/
RUN chmod a+x /root/entrypoint.sh

RUN mkdir -p /root/work
WORKDIR /root/work

EXPOSE 8080
ENTRYPOINT ["../entrypoint.sh"]
CMD ["dev"]






