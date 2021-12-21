from sqlalchemy import *
from base import Base


class Unite(Base):
  __tablename__ = 'tunite'
  id = Column('id', Integer, primary_key=True)
  nom = Column('UNI_Nom', String, nullable=False)