from flask import Flask, redirect, render_template, url_for, request
from markupsafe import escape
import requests
import mysql.connector

app = Flask(__name__)

@app.route('/')
def btc():
    cursor = mydb.cursor()
    cursor.execute("""SELECT * FROM mysqlsite.TB_bitcoin 
                   ORDER BY tempo DESC LIMIT 10""")
    data = cursor.fetchall()

    dados = list()
    for dado in data:
        dados.append({
            "valor": dado[0],
            "volume": dado[1],
            "variacao": dado[2],
            "tempo": dado[3]
        })
    dados.append({
        "valor":1212
    })

    cursor.close()
    return render_template("btc.html", dados=dados, data=data)

if __name__ == "__main__":

    mydb = mysql.connector.connect(
    host='db',
    user='root',
    password='root',
    database='mysqlsite',
    )

    app.run(debug=True, port=3000, host='0.0.0.0')