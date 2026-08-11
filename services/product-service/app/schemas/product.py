from pydantic import BaseModel
from pydantic import ConfigDict
from pydantic import Field


class ProductCreate(BaseModel):

    # Vehicle identity
    slug: str = Field(
        min_length=1,
        max_length=150
    )

    type: str = Field(
        min_length=1,
        max_length=20
    )

    brand: str = Field(
        min_length=1,
        max_length=100
    )

    model: str = Field(
        min_length=1,
        max_length=100
    )

    variant: str = Field(
        min_length=1,
        max_length=100
    )

    # Vehicle information
    year: int = Field(
        ge=1900,
        le=2100
    )

    mileage: int = Field(
        ge=0
    )

    imported_from: str | None = Field(
        default=None,
        max_length=100
    )

    # Performance
    engine: str | None = Field(
        default=None,
        max_length=150
    )

    horsepower: int | None = Field(
        default=None,
        ge=0
    )

    drivetrain: str | None = Field(
        default=None,
        max_length=50
    )

    transmission: str | None = Field(
        default=None,
        max_length=100
    )

    fuel_type: str | None = Field(
        default=None,
        max_length=50
    )

    # Appearance
    exterior_color: str | None = Field(
        default=None,
        max_length=100
    )

    interior_color: str | None = Field(
        default=None,
        max_length=100
    )

    # Ownership
    owners: int | None = Field(
        default=None,
        ge=0
    )

    # Pricing
    original_price: float = Field(
        gt=0
    )

    current_price: float = Field(
        gt=0
    )

    savings: float = Field(
        default=0,
        ge=0
    )

    # Marketplace status
    certified: bool = False

    featured: bool = False

    collector_edition: bool = False

    arrival: str | None = Field(
        default=None,
        max_length=100
    )

    # Presentation
    tagline: str | None = Field(
        default=None,
        max_length=255
    )

    description: str | None = None

    image_url: str | None = Field(
        default=None,
        max_length=500
    )

    # Vehicle story / certification
    ownership_story: str | None = None

    collector_notes: str | None = None

    inspection: str | None = None

    delivery: str | None = None

    recommended_for: str | None = None


class ProductResponse(ProductCreate):
    id: int

    model_config = ConfigDict(
        from_attributes=True
    )
