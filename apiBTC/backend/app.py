import requests
import mysql.connector
import time
 
def get_btc_data():
    cursor = mydb.cursor()
    data = requests.get('http://cointradermonitor.com/api/pbb/v1/ticker').json()

    insere_dado = ("""INSERT INTO TB_bitcoin 
                          (valor, volume, variacao, tempo) VALUES (%s, %s, %s, %s)""")
    dados = list()
    """ dados.append(data["last"])
    dados.append(data["volume24h"])
    dados.append(data["var24h"])
    dados.append(data["time"])
    """
    dados.append(1)
    dados.append(2)
    dados.append(3)
    dados.append(4)

    cursor.execute(insere_dado, dados)
    cursor.close()
    
    return

if __name__ == "__main__":

    mydb = mysql.connector.connect(
    host='db',
    user='root',
    password='root',
    database='mysqlsite',
    )

    while True:
        print("socorro")
        get_btc_data()
        time.sleep(2)