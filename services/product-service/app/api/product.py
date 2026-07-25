from fastapi import APIRouter
from fastapi import Depends
from sqlalchemy.orm import Session

from app.core.database import SessionLocal
from app.schemas.product import ProductCreate
from app.schemas.product import ProductResponse
from app.services.product_service import (
    create_product,
    get_all_products,
    get_product_by_id,
    update_product,
    delete_product,
)

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


@router.get(
    "/products/{product_id}",
    response_model=ProductResponse
)
def get_product(
    product_id: int,
    db: Session = Depends(get_db)
):

    return get_product_by_id(
        db,
        product_id
    )


@router.put(
    "/products/{product_id}",
    response_model=ProductResponse
)
def edit_product(
    product_id: int,
    product: ProductCreate,
    db: Session = Depends(get_db)
):

    return update_product(
        db,
        product_id,
        product
    )


@router.delete(
    "/products/{product_id}"
)
def remove_product(
    product_id: int,
    db: Session = Depends(get_db)
):

    return delete_product(
        db,
        product_id
    )