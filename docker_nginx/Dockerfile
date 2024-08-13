FROM nginx:1.21.1
WORKDIR /the/workdir/path
RUN  rm -rf /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]