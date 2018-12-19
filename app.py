## FLASK_APP=app.py flask run --host=0.0.0.0 (start webserver)


import flask
from flask import request, jsonify
import platform
import sqlite3
import json

app = flask.Flask(__name__)

app.config["DEBUG"] = True


data_client = [
        {
        "name":"Dude One",
        "id": 11,
         },
     {
        "name":"Dude Two",
        "id": 13,
         }
     ]
        

@app.route('/', methods = ['GET'])
def main():
    """ homepage """
    return 'System info {0}'.format(platform.uname())


@app.route('/data', methods = ['GET'])
def all():
    """ return all data from data_client """
    with open("books","r") as f:
        return jsonify(json.dump(f))
    # flask.jsonify(dict) returns flask.Response() object vs json.dumps which return a string
    #return jsonify(data_client)

@app.route('/data/user', methods = ['GET'])
def get_user():
    """return an user based on user id"""
    #check if we have id if the URL query /data/user?id=312
    if 'id' in request.args:
        id_from_URL = int(request.args['id'])
    else:
        return "Error: No id field was provided"

    #create results list
    results = []

    for i in data_client:
        print(i)
        if i['id'] ==  id_from_URL:
            print (i["id"])
            results.append(i)

    return jsonify(results)

@app.route('/data/name', methods = ["POST"])
def add_user():
    """ get the name from body of post requests"""
    name = request.get_json()['name']
    return "Hello {0}".format(name)

#----------------------------------------------------------------#

@app.route('/book', methods = ["GET"])
def all_db():
    """ get all the books from db"""
    #create connection
    conn =  sqlite3.connect('books.db')
    
    #create cursor
    cur = conn.cursor()
    cur.execute("SELECT * from books")

    rows = cur.fetchall()

    return jsonify(rows)


@app.route('/book', methods = ["GET"])
def filter_db():
    """ return a book from  db """

    # 127.0.0.1:5000/book?author=Connie+Willis&published=1999
    query_parameters = request.args
    
    id = query_parameters.get('id')
    published = query_parameters.get('published')
    author = query_parameters.get('author')

    query = "SELECT * FROM books WHERE"
    to_filter = []

    if id:
        query += ' id=? AND'
        to_filter.append(id)
    if published:
        query += ' published=? AND'
        to_filter.append(published)
    if author:
        query += ' author=? AND'
        to_filter.append(author)
    if not (id or published or author):
        return "Page not found 404"
    
    query = query[:-4] + ';'

    conn = sqlite3.connect('books.db')
    cur = conn.cursor()
    results = cur.execute(query, to_filter).fetchall()

    return jsonify(results)

if __name__ ==  "__main__":
    app.run()
