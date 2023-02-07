FROM node:18-alpine
WORKDIR /server
COPY package.json package-lock.json /server/
RUN npm install --production
RUN npm i nodemon -D
COPY . /server/
CMD npm run dev
