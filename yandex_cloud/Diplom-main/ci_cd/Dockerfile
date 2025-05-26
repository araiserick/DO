FROM alpine:3.14
RUN apk add --no-cache curl nginx
COPY ./html/ /var/www/html
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80