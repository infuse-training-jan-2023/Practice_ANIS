FROM node:18-alpine
WORKDIR /src/
COPY package.json package-lock.json /src/
RUN npm install --production
COPY . /src/
ARG arg
ENV port_no=${arg}
EXPOSE ${port_no}
CMD ["node", "bin/www"]
