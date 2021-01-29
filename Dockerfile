    # docker file to build an application and then serve it from nginx
    
    FROM node:alpine
    WORKDIR '/app'
    COPY package.json .
    RUN npm install
    COPY . .
    RUN npm run build
     
    FROM nginx
    EXPOSE 80
    COPY --from=0 /app/build /usr/share/nginx/html

    # multi step process
    # copy from another phase : folder to copy from : folder to copy to
    # image consists only of content in copy method

    #BUILD: docker build .
    #Execute docker run -p 8081:80 <docker-image>