from fastapi import APIRouter
from fastapi import Depends
from sqlalchemy.orm import Session

from app.core.database import SessionLocal
from app.schemas.product import ProductCreate
from app.schemas.product import ProductResponse
from app.services.product_service import create_product
from app.services.product_service import get_all_products

router = APIRouter()


def get_db():
    db = SessionLocal()

    try:
        yield db

    finally:
        db.close()


@router.post(
    "/products",
    response_model=ProductResponse
)
def add_product(
    product: ProductCreate,
    db: Session = Depends(get_db)
):

    return create_product(
        db,
        product
    )


@router.get(
    "/products",
    response_model=list[ProductResponse]
)
def list_products(
    db: Session = Depends(get_db)
):

    return get_all_products(db)