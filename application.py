from flask import Flask, escape, request
from werkzeug.middleware.proxy_fix import ProxyFix

application = Flask(__name__)
application.wsgi_app = ProxyFix(application.wsgi_app)

@application.route('/')
def hello():
    name = request.args.get("name", "World")
    greeting = "Secure hello" if request.url.startswith('https://') else "Non-secure hello"
    return f'{greeting}, {escape(name)}!'