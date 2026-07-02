FROM python:3.11-alpine

# Instalar dependencias
RUN pip install flask --no-cache-dir

# Crear directorio de trabajo
WORKDIR /app

# Copiar la aplicacion
COPY app.py .

# El volumen persistente se montara en /data
VOLUME ["/data"]

EXPOSE 8080

CMD ["python", "app.py"]
