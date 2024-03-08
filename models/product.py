from models.base import Base
from sqlalchemy import Integer, String, Text, DateTime, func
from sqlalchemy.orm import mapped_column, relationship, backref
from sqlalchemy.sql import func


class Product(Base):
    __tablename__ = 'product'

    id = mapped_column(Integer, primary_key=True, autoincrement=True)
    name = mapped_column(String(100), nullable=False)
    price = mapped_column(Integer)
    description = mapped_column(Text)
    created_at = mapped_column(DateTime(timezone=True), server_default=func.now())

    reviews= relationship("Review", cascade="all,delete-orphan")

    def __repr__(self):
        return f'<Product {self.name}>'