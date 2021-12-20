from sqlalchemy import *
from base import Base


class TypeRecette(Base):
  __tablename__ = 'ttyperecette'
  id = Column('id', Integer, primary_key=True)
  nom = Column('TYPR_Nom', String, nullable=False)

