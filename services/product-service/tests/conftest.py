import os

import pytest
from fastapi.testclient import TestClient
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

os.environ["DB_HOST"] = "postgres"
os.environ["DB_PORT"] = "5432"
os.environ["DB_NAME"] = "cloudcart_test"
os.environ["DB_USER"] = "cloudcart_user"
os.environ["DB_PASSWORD"] = "cloudcart_password"

from app.main import app
from app.core.database import Base
from app.api.product import get_db


TEST_DATABASE_URL = (
    "postgresql://cloudcart_user:cloudcart_password"
    "@postgres:5432/cloudcart_test"
)

test_engine = create_engine(
    TEST_DATABASE_URL,
    pool_pre_ping=True
)

TestingSessionLocal = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=test_engine
)


@pytest.fixture
def db_session():
    Base.metadata.drop_all(bind=test_engine)
    Base.metadata.create_all(bind=test_engine)

    db = TestingSessionLocal()

    try:
        yield db
    finally:
        db.close()


@pytest.fixture
def client(db_session):
    def override_get_db():
        yield db_session

    app.dependency_overrides[get_db] = override_get_db

    with TestClient(app) as test_client:
        yield test_client

    app.dependency_overrides.clear()
