# stage 1
FROM node:10 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-with-docker /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/
