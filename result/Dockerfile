FROM node:18.18.2-alpine

WORKDIR /app

ENV NODE_ENV production

COPY package*.json .

RUN npm ci --omit=dev

USER node

COPY --chown=node:node . .

EXPOSE 8888

CMD [ "npm", "start" ]





