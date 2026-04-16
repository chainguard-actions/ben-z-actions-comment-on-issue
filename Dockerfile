FROM node:slim

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install --production

ENTRYPOINT ["node", "/usr/src/app/lib/main.js"]
