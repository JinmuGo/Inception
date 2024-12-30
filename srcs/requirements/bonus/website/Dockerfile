FROM alpine:3.20

WORKDIR /app

RUN apk update && \
	apk add nodejs npm

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]