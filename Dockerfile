# specify the node base image with your desired version node:<version>
FROM node:8
ENV NODE_PORT=8080
ENV WORKDIR=/root/work

# install node basic enviorment
RUN npm -g install nrm \
    && nrm use taobao \
    && npm -g install npm \
    && npm -g install cnpm

# user entrypoint to start node app.
COPY ./entrypoint.sh /root/
RUN chmod a+x /root/entrypoint.sh

RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}

EXPOSE ${NODE_PORT}
ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["dev"]






