FROM nginx:alpine

COPY templates/ /usr/share/nginx/html/
COPY static/ /usr/share/nginx/html/static/

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
