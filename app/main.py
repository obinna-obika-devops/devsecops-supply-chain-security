from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/healthz")
def healthz():
    return jsonify(status="ok")

@app.get("/api/v1/version")
def version():
    return jsonify(service="secure-demo", version="1.0.0")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
