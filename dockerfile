FROM node:alpine 

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build -f

FROM nginx
COPY  --from=0 /app/build /usr/share/nginx/html
