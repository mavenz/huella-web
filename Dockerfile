# Imagen base mínima de Nginx
FROM nginx:alpine

# Copiamos el sitio estático
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./style.css  /usr/share/nginx/html/style.css
COPY ./posts      /usr/share/nginx/html/posts

# Opcional: cabeceras simples y caché estática
RUN printf 'add_header X-Content-Type-Options "nosniff" always;\n\
add_header Referrer-Policy "strict-origin-when-cross-origin" always;\n\
add_header X-Frame-Options "SAMEORIGIN" always;\n\
server_tokens off;\n' > /etc/nginx/conf.d/security.conf
