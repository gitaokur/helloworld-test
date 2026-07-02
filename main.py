import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Günaydın.!!!"

if __name__ == "__main__":
    # Cloud Run port'u environment variable olarak verir, varsayılan 8080'dir.
    port = int(os.environ.get("PORT", 8080))
    # Production için normalde Gunicorn kullanılır ama lab için Flask'ın kendi server'ı yeterlidir.
    app.run(debug=True, host="0.0.0.0", port=port)
