#Build phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#Second phase for run
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
