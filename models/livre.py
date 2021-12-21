from sqlalchemy import *
from base import Base
from source import Source


class Livre(Base):
  __tablename__ = 'tlivre'
  id = Column('SOU_id', Integer, ForeignKey(Source.id), primary_key=True)
  nom = Column('LIV_Nom', String, nullable=False)
  edition = Column('LIV_Edition', String)
  imagelivre = Column('LIV_ImageLivre', String)