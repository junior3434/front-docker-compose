FROM nginx:1.19-alpine

COPY ./nginx/conf.d/uspider-admin.conf /etc/nginx/conf.d/uspider-admin.conf
