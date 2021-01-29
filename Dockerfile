    FROM node:alpine
    WORKDIR '/app'
    COPY package.json .
    RUN npm install
    COPY . .
    RUN npm run build
     
    FROM nginx
    COPY --from=0 /app/build /usr/share/nginx/html

    # multi step process
    # copy from another phase : folder to copy from : folder to copy to
    # image consists only of content in copy method