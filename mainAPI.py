import configparser
from flask import Flask, app, request, jsonify, make_response
from flask_sqlalchemy import SQLAlchemy
from marshmallow_sqlalchemy import SQLAlchemyAutoSchema
from marshmallow import fields
from sqlalchemy import *
from sqlalchemy.ext.declarative.api import declarative_base
from pymysql import *
from sqlalchemy.dialects.mysql import *

# Load config file
config = configparser.ConfigParser()
config.read('config.ini')
print(config['mysql'])

# Init app
app = Flask(__name__)

# Database
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root@localhost/KitchenOfWisdom'

# Init db
db = SQLAlchemy(app)

 

class TypeIngredient(db.Model):
  __tablename__ = 'ttypeingredient'
  id = db.Column('id', db.Integer, primary_key=True)
  nom = db.Column('TYPI_Nom', db.String, nullable=False)

@app.route('/')
def index():
  testTypeIngredient = TypeIngredient(nom = 'Fruit')
  db.session.add(testTypeIngredient)
  db.session.commit()
  return ''




#engine = create_engine('mysql://root@localhost/KitchenOfWisdom', echo = True)
#engine.connect()
#Base = declarative_base()



#class TypeIngredient(Base):
 #   id = db.Column(db.Integer, primary_key=True)
 #   nom = db.Column(db.String, nullable=False)





# Run server
if __name__ == "__main__":
  app.run(debug=True)
