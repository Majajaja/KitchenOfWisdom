from sqlalchemy import *
from base import Base


class Ingredient(Base):
  __tablename__ = 'tingredient'
  id = Column('id', Integer, primary_key=True)
  nom = Column('ING_Nom', String, nullable=False)
  description = Column('ING_Description', String, nullable=False)

