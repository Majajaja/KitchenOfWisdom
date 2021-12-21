from sqlalchemy import *
from base import Base
from recette import Recette
from ingredient import Ingredient
from unite import Unite

class Composant(Base):
  __tablename__ = 'tcomposant'
  REC_Id = Column('REC_Id', Integer, ForeignKey(Recette.id), primary_key=True)
  ING_Id = Column('ING_Id', Integer, ForeignKey(Ingredient.id), primary_key=True)
  UNI_Id = Column('UNI_Id', Integer, ForeignKey(Unite.id), primary_key=True)
  quantite = Column('COM_Quantite', String, nullable=False)
  
