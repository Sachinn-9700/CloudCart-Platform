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
    slug = Column(
        String(150),
        unique=True,
        nullable=False,
        index=True
    )

    type = Column(
        String(20),
        nullable=False,
        index=True
    )

    brand = Column(
        String(100),
        nullable=False,
        index=True
    )

    model = Column(
        String(100),
        nullable=False,
        index=True
    )

    variant = Column(
        String(100),
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
        String(100),
        nullable=True
    )

    # Performance
    engine = Column(
        String(150),
        nullable=True
    )

    horsepower = Column(
        Integer,
        nullable=True
    )

    drivetrain = Column(
        String(50),
        nullable=True
    )

    transmission = Column(
        String(100),
        nullable=True
    )

    fuel_type = Column(
        String(50),
        nullable=True
    )

    # Appearance
    exterior_color = Column(
        String(100),
        nullable=True
    )

    interior_color = Column(
        String(100),
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
        String(100),
        nullable=True
    )

    # Presentation
    tagline = Column(
        String(255),
        nullable=True
    )

    description = Column(
        Text,
        nullable=True
    )

    image_url = Column(
        String(500),
        nullable=True
    )

    # Vehicle story / certification
    ownership_story = Column(
        Text,
        nullable=True
    )

    collector_notes = Column(
        Text,
        nullable=True
    )

    inspection = Column(
        Text,
        nullable=True
    )

    delivery = Column(
        Text,
        nullable=True
    )

    recommended_for = Column(
        Text,
        nullable=True
    )
