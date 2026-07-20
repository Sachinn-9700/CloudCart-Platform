from fastapi import FastAPI
from sqlalchemy import text
from prometheus_fastapi_instrumentator import Instrumentator
from app.api.auth import router as auth_router
from app.core.database import engine
from app.core.database import Base

app = FastAPI(
    title="CloudCart Auth Service",
    version="1.0.0"
)

Base.metadata.create_all(bind=engine)

app.include_router(auth_router)

@app.get("/health")
def health_check():
    return {
        "status": "healthy",
        "service": "auth-service"
    }

@app.get("/db-health")
def db_health_check():

    try:
        with engine.connect() as connection:
            connection.execute(text("SELECT 1"))

        return {
            "database": "connected"
        }

    except Exception as error:
        return {
            "database": "failed",
            "error": str(error)
        }

Instrumentator().instrument(app).expose(app)
