from flask import Flask, redirect, render_template, url_for, request
from markupsafe import escape
import requests

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

# variaveis passadas por parametros
@app.route('/<name>')
def nome(name):
    return f"Hello, {escape(name)}"

@app.route('/direto')
def diretorio():
    return redirect(url_for("hello", name="joao"))

# constroi uma URL para uma função especifica
with app.test_request_context():
    print(url_for('nome', name="joao"))
    print(url_for('diretorio'))
    print(url_for("index"))

@app.route('/login', methods=['GET', 'POST'])
def method_name():
    if request.method == 'POST':
        return "Executa POST, envia dados para serem processados"
    else:
        return "Executa GET, obtém dados do servidor"

# é possível separar usando marcadores

@app.get("/login2")
def login_get():
    return "Executa GET, obtém dados do servidor"

@app.post("/login2")
def login_post():
    return "Executa POST, envia dados para serem processados"

@app.route('/hello/')
@app.route("/hello/<name>")
def hello(name=None):
    return render_template("hello.html", person=name)

@app.route('/bitcoin')
def btc():
    data = requests.get('http://cointradermonitor.com/api/pbb/v1/ticker').json()
    return render_template("btc.html", last=data["last"], volume24h=data["volume24h"], var24h=data["var24h"])

if __name__ == "__main__":
    app.run(debug=True, port=5000, host='0.0.0.0')