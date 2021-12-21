from sqlalchemy import *
from base import Base
from source import Source


class SiteWeb(Base):
  __tablename__ = 'tsiteweb'
  id = Column('SOU_id', Integer, ForeignKey(Source.id), primary_key=True)
  nom = Column('SIT_Nom', String, nullable=False)
  lien = Column('SIT_LienURL', String, nullable=False)