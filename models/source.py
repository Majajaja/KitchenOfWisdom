from sqlalchemy import *
from base import Base

class Source(Base):
  __tablename__ = 'tsource'
  id = Column('id', Integer, primary_key=True)
  nom = Column('SOU_ImageRecette', String, nullable=False)
