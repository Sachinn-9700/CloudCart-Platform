from fastapi import APIRouter

router = APIRouter()


@router.get("/products")
def get_products():
    return {
        "message": "Product Service is running"
    }
