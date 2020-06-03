FROM brivad/meteor:1.10.2 AS dev
WORKDIR /app
COPY package*.json ./
COPY .meteor .meteor
ENV METEOR_ALLOW_SUPERUSER=true
RUN meteor npm install

FROM dev AS build
COPY . .
RUN meteor build . --directory

FROM node:12-alpine AS production
WORKDIR /app
COPY --from=build /app/bundle .
ENV NODE_ENV=production
ENV PORT=3000
RUN cd /app/programs/server && npm install --production
EXPOSE 3000
CMD node main.js
