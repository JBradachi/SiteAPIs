from flask import Flask, redirect, render_template, url_for, request
from markupsafe import escape
import requests
from flask_mysqldb import MySQL

app = Flask(__name__)

# Tirar daqui 
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_DB'] = 'mysqlsite'

mysql = MySQL(app)

@app.route('/')
def btc():
    cursor = mysql.connection.cursor()
    cursor.execute("""SELECT * FROM mysqlsite.TB_bitcoin 
                   ORDER BY PK_tempo DESC""")
    data = cursor.fetchall()
    cursor.close()
    return render_template("btc.html", last=data["last"], volume24h=data["volume24h"], var24h=data["var24h"])

if __name__ == "__main__":
    app.run(debug=True, port=5000, host='0.0.0.0')