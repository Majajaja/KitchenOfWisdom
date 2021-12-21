from sqlalchemy import *
from base import Base
from sqlalchemy.orm import relationship
from typeingredient import TypeIngredient


class Ingredient(Base):
  __tablename__ = 'tingredient'
  id = Column('id', Integer, primary_key=True)
  nom = Column('ING_Nom', String, nullable=False)
  description = Column('ING_Description', String, nullable=False)
  TYPI_Id = Column('TYPI_Id', Integer, ForeignKey(TypeIngredient.id))

