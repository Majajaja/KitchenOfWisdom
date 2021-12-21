from sqlalchemy import *
from base import Base
from source import Source


class Autre(Base):
  __tablename__ = 'tautre'
  id = Column('SOU_id', Integer, ForeignKey(Source.id), primary_key=True)
  nom = Column('AUT_Nom', String, nullable=False)
