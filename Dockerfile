# Imagen base mínima de Nginx
FROM nginx:alpine

# Copiamos TODO el sitio estático a la carpeta del servidor
COPY . /usr/share/nginx/html

# Opcional: cabeceras simples y caché estática
RUN printf 'add_header X-Content-Type-Options "nosniff" always;\n\
add_header Referrer-Policy "strict-origin-when-cross-origin" always;\n\
add_header X-Frame-Options "SAMEORIGIN" always;\n\
server_tokens off;\n' > /etc/nginx/conf.d/security.conf