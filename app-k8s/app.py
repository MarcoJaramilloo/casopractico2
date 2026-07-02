from flask import Flask
import os

app = Flask(__name__)

# Ruta del archivo contador en el volumen persistente
COUNTER_FILE = "/data/contador.txt"

def get_counter():
    """Lee el contador del volumen persistente."""
    if os.path.exists(COUNTER_FILE):
        with open(COUNTER_FILE, "r") as f:
            return int(f.read().strip())
    return 0

def save_counter(value):
    """Guarda el contador en el volumen persistente."""
    os.makedirs("/data", exist_ok=True)
    with open(COUNTER_FILE, "w") as f:
        f.write(str(value))

@app.route("/")
def index():
    count = get_counter() + 1
    save_counter(count)
    return f"""
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Contador Persistente - UNIR CP2</title>
        <style>
            body {{ font-family: Arial, sans-serif; text-align: center; 
                   padding: 50px; background: #0f3460; color: #eee; }}
            h1 {{ color: #e94560; }}
            .counter {{ font-size: 80px; color: #00d4ff; font-weight: bold; }}
            .info {{ background: #16213e; padding: 20px; border-radius: 10px; 
                    margin: 20px auto; max-width: 600px; }}
        </style>
    </head>
    <body>
        <h1>Caso Practico 2 - App con Persistencia</h1>
        <div class="info">
            <p>Visita numero:</p>
            <div class="counter">{count}</div>
            <p>Universidad Internacional de La Rioja (UNIR)</p>
            <p>Desplegado en: Kubernetes (AKS)</p>
            <p>Almacenamiento: PVC managed-csi (Azure Disk)</p>
            <p>Imagen desde: Azure Container Registry (ACR)</p>
        </div>
    </body>
    </html>
    """

@app.route("/health")
def health():
    return {{"status": "ok", "counter": get_counter()}}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
