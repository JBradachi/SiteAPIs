from flask import Flask, render_template, request
from flask_mysqldb import MySQL
from markupsafe import escape
app = Flask(__name__)

# Tirar daqui 
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_DB'] = 'mysqlsite'

mysql = MySQL(app)

@app.route("/", methods=['GET'])
def index():
    cur = mysql.connection.cursor()
    cur.execute("""SELECT * FROM mysqlsite.TB_patrocinadores 
                ORDER BY nivel_patrocinador DESC""")
    patrocinadores = cur.fetchall()
    return render_template("index.html", patrocinadores=patrocinadores)

@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    return render_template("dashboard.html", selecao="nada")

@app.route('/publicacoes')
def publicacoes():

    cursor = mysql.connection.cursor()
    cursor.execute("""SELECT * FROM mysqlsite.TB_publicacoes 
                   ORDER BY ano_publicacao""")
    publicacoes = cursor.fetchall()
    cursor.close()
    return render_template("publicacoes.html", publicacoes=publicacoes)

@app.route('/noticias', methods=['GET', 'POST'])
def noticias():
    if request.method == 'POST':
        
        # pega request do site
        noticia = request.form.get("noticia")
        data = request.form.get("data") 

        cursor = mysql.connection.cursor()
        insere_noticia = ("""INSERT INTO TB_noticia 
                          (PK_titulo, data_postagem) VALUES (%s, %s)""")
        dados_noticia = {noticia, data}
        cursor.execute(insere_noticia, dados_noticia)
        mysql.connection.commit()
        cursor.close()
    cursor = mysql.connection.cursor()
    cursor.execute("""SELECT * FROM mysqlsite.TB_noticia 
                   ORDER BY data_postagem DESC""")
    noticias = cursor.fetchall()
    cursor.close()
    return render_template("noticias.html", noticias=noticias)

if __name__ == "__main__":
    app.run(debug=True, port=5000, host='0.0.0.0')