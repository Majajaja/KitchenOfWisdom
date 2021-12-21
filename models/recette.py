from sqlalchemy import *
from base import Base
from source import Source
from typerecette import TypeRecette


class Recette(Base):
  __tablename__ = 'trecette'
  id = Column('id', Integer, primary_key=True)
  nom = Column('REC_Nom', String, nullable=False)
  description = Column('REC_Description', String, nullable=False)
  tempspreparation = Column('REC_TempsPreparation', String)
  nombrepersonne = Column('REC_NombrePersonne', String)
  SOU_Id = Column('SOU_Id', Integer, ForeignKey(Source.id))
  TYPR_Id = Column('TYPR_Id', Integer, ForeignKey(TypeRecette.id))

