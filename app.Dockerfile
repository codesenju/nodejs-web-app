FROM node:alpine
WORKDIR /project-folder
COPY package*.json ./
COPY *.js .
COPY test/test-pages.js ./test/test-pages.js
RUN npm install
CMD  ["node", "server.js"]
