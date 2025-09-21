FROM node:18-alpine

WORKDIR /rhodes_mason_site

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 7775

CMD ["npm", "start", "--", "-p", "7775"]