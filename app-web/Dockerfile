FROM docker.io/nginx:alpine

# Instalar openssl y apache2-utils para htpasswd
RUN apk add --no-cache openssl apache2-utils

# Generar certificado x.509 autofirmado
RUN mkdir -p /etc/nginx/ssl &&     openssl req -x509 -nodes -days 365 -newkey rsa:2048     -keyout /etc/nginx/ssl/cert.key     -out /etc/nginx/ssl/cert.crt     -subj "/C=EC/ST=ElOro/L=Machala/O=UNIR/CN=casopractico2"

# Crear usuario para autenticacion basica (usuario: alumno, password: unir2026)
RUN htpasswd -cb /etc/nginx/.htpasswd alumno unir2026

# Copiar configuracion de nginx con HTTPS y auth basica
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar contenido web
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
