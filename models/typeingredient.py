from sqlalchemy import *
from base import Base


class TypeIngredient(Base):
  __tablename__ = 'ttypeingredient'
  id = Column('id', Integer, primary_key=True)
  nom = Column('TYPI_Nom', String, nullable=False)

