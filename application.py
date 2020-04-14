from flask import Flask, escape, request
from werkzeug.middleware.proxy_fix import ProxyFix

app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app)

@app.route('/')
def hello():
    name = request.args.get("name", "World")
    greeting = "Secure hello" if request.url.startswith('https://') else "Non-secure hello"
    return f'{greeting}, {escape(name)}!'