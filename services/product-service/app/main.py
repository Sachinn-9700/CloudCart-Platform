from fastapi import FastAPI
from sqlalchemy import text

from prometheus_fastapi_instrumentator import Instrumentator

from app.api.product import router as product_router
from app.core.database import Base
from app.core.database import engine


app = FastAPI(
    title="CloudCart Product Service",
    description="Vehicle inventory API for the CloudCart platform.",
    version="2.0.0"
)


Base.metadata.create_all(bind=engine)

app.include_router(product_router)


@app.get("/health")
def health_check():
    return {
        "status": "healthy",
        "service": "product-service"
    }


@app.get("/db-health")
def db_health_check():
    try:
        with engine.connect() as connection:
            connection.execute(text("SELECT 1"))

        return {
            "status": "healthy",
            "database": "connected"
        }

    except Exception:
        return {
            "status": "unhealthy",
            "database": "failed"
        }


Instrumentator().instrument(app).expose(app)
