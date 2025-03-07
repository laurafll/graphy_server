# Use the appropriate base image (update if needed)
FROM debian:buster

# Update package lists and install the fixed Git version
RUN apt-get update && \
    apt-get install -y git=1:2.20.1-2+deb10u9 git-man=1:2.20.1-2+deb10u9 && \
    rm -rf /var/lib/apt/lists/*

FROM node:hydrogen-buster
COPY graphserver.js .
COPY package.json .
COPY UScities.json .
RUN npm install &&\
    apk update &&\
    apk upgrade
EXPOSE  4000
CMD node graphserver.js
