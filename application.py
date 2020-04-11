from flask import Flask, escape, request

application = Flask(__name__)

@application.route('/')
def hello():
    name = request.args.get("name", "World")
    greeting = "Secure hello" if request.url.startswith('https://') else "Non-secure hello"
    return f'{greeting}, {escape(name)}!'