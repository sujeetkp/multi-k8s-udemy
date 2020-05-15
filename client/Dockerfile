FROM node:alpine
WORKDIR '/app'
COPY ./package*.json ./
RUN npm install
COPY . .
RUN npm run build

# nginx container automatically starts nginx
# COPY command copies the files from the previous phase/stage i.e. stage 0
# Previos phase/stage creates Temporary container to build the app

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /app/build /usr/share/nginx/html

