from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class TypeIngredient(Base):
  __tablename__ = 'ttypeingredient'
  id = Column('id', Integer, primary_key=True)
  nom = Column('TYPI_Nom', String, nullable=False)

""" class TypeIngredient(db.Model):
  __tablename__ = 'ttypeingredient'
  id = db.Column('id', db.Integer, primary_key=True)
  nom = db.Column('TYPI_Nom', db.String, nullable=False)

class TypeRecette(db.Model) """