from sqlalchemy import Boolean
from sqlalchemy import Column
from sqlalchemy import Float
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import Text

from app.core.database import Base


class Product(Base):
    __tablename__ = "products"

    id = Column(
        Integer,
        primary_key=True,
        index=True
    )

    # Vehicle identity
    brand = Column(
        String,
        nullable=False,
        index=True
    )

    model = Column(
        String,
        nullable=False,
        index=True
    )

    variant = Column(
        String,
        nullable=False
    )

    # Vehicle information
    year = Column(
        Integer,
        nullable=False,
        index=True
    )

    mileage = Column(
        Integer,
        nullable=False,
        default=0
    )

    imported_from = Column(
        String,
        nullable=True
    )

    # Performance
    engine = Column(
        String,
        nullable=True
    )

    horsepower = Column(
        Integer,
        nullable=True
    )

    drivetrain = Column(
        String,
        nullable=True
    )

    transmission = Column(
        String,
        nullable=True
    )

    fuel_type = Column(
        String,
        nullable=True
    )

    # Appearance
    exterior_color = Column(
        String,
        nullable=True
    )

    interior_color = Column(
        String,
        nullable=True
    )

    # Ownership
    owners = Column(
        Integer,
        nullable=True
    )

    # Pricing
    original_price = Column(
        Float,
        nullable=False
    )

    current_price = Column(
        Float,
        nullable=False
    )

    savings = Column(
        Float,
        nullable=False,
        default=0
    )

    # Marketplace status
    certified = Column(
        Boolean,
        default=False,
        nullable=False
    )

    featured = Column(
        Boolean,
        default=False,
        nullable=False
    )

    collector_edition = Column(
        Boolean,
        default=False,
        nullable=False
    )

    arrival = Column(
        String,
        nullable=True
    )

    # Presentation
    tagline = Column(
        String,
        nullable=True
    )

    description = Column(
        Text,
        nullable=True
    )

    image_url = Column(
        String,
        nullable=True
    )
    