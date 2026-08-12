def product_payload():
    return {
        "slug": "porsche-911-gt3-rs-test",
        "type": "car",
        "brand": "Porsche",
        "model": "911",
        "variant": "GT3 RS",
        "year": 2023,
        "mileage": 4800,
        "imported_from": "UAE",
        "engine": "4.0L Naturally Aspirated Flat-6",
        "horsepower": 518,
        "drivetrain": "RWD",
        "transmission": "PDK Automatic",
        "fuel_type": "Petrol",
        "exterior_color": "Arctic Grey",
        "interior_color": "Black Alcantara",
        "owners": 1,
        "original_price": 38000000,
        "current_price": 17800000,
        "savings": 20200000,
        "certified": True,
        "featured": True,
        "collector_edition": False,
        "arrival": "New Arrival",
        "tagline": "Track-Bred Precision",
        "description": "Test vehicle",
        "image_url": "porsche-gt3rs.png",
        "ownership_story": "Single owner",
        "collector_notes": "Collector appeal",
        "inspection": "Passed inspection",
        "delivery": "Complete documentation",
        "recommended_for": "Track Days",
    }


def test_create_product(client):
    response = client.post(
        "/products",
        json=product_payload(),
    )

    assert response.status_code == 201

    data = response.json()

    assert data["slug"] == "porsche-911-gt3-rs-test"
    assert data["brand"] == "Porsche"
    assert data["model"] == "911"
    assert data["current_price"] == 17800000
    assert data["featured"] is True


def test_list_products(client):
    create_response = client.post(
        "/products",
        json=product_payload(),
    )

    assert create_response.status_code == 201

    response = client.get("/products")

    assert response.status_code == 200

    data = response.json()

    assert len(data) == 1
    assert data[0]["slug"] == "porsche-911-gt3-rs-test"


def test_get_product(client):
    create_response = client.post(
        "/products",
        json=product_payload(),
    )

    assert create_response.status_code == 201

    product_id = create_response.json()["id"]

    response = client.get(
        f"/products/{product_id}"
    )

    assert response.status_code == 200

    data = response.json()

    assert data["id"] == product_id
    assert data["brand"] == "Porsche"
    assert data["model"] == "911"


def test_filter_products_by_brand(client):
    create_response = client.post(
        "/products",
        json=product_payload(),
    )

    assert create_response.status_code == 201

    response = client.get(
        "/products?brand=Porsche"
    )

    assert response.status_code == 200

    data = response.json()

    assert len(data) == 1
    assert data[0]["brand"] == "Porsche"


def test_filter_products_by_featured(client):
    create_response = client.post(
        "/products",
        json=product_payload(),
    )

    assert create_response.status_code == 201

    response = client.get(
        "/products?featured=true"
    )

    assert response.status_code == 200

    data = response.json()

    assert len(data) == 1
    assert data[0]["featured"] is True


def test_update_product(client):
    create_response = client.post(
        "/products",
        json=product_payload(),
    )

    assert create_response.status_code == 201

    product_id = create_response.json()["id"]

    payload = product_payload()
    payload["current_price"] = 17000000
    payload["featured"] = False

    response = client.put(
        f"/products/{product_id}",
        json=payload,
    )

    assert response.status_code == 200

    data = response.json()

    assert data["current_price"] == 17000000
    assert data["featured"] is False


def test_delete_product(client):
    create_response = client.post(
        "/products",
        json=product_payload(),
    )

    assert create_response.status_code == 201

    product_id = create_response.json()["id"]

    response = client.delete(
        f"/products/{product_id}"
    )

    assert response.status_code == 200

    data = response.json()

    assert data["message"] == "Product deleted successfully"


def test_get_product_not_found(client):
    response = client.get("/products/99999")

    assert response.status_code == 404
    assert response.json()["detail"] == "Product not found"


def test_update_product_not_found(client):
    response = client.put(
        "/products/99999",
        json=product_payload(),
    )

    assert response.status_code == 404
    assert response.json()["detail"] == "Product not found"


def test_delete_product_not_found(client):
    response = client.delete("/products/99999")

    assert response.status_code == 404
    assert response.json()["detail"] == "Product not found"


def test_create_product_invalid_payload(client):
    payload = product_payload()

    del payload["brand"]

    response = client.post(
        "/products",
        json=payload,
    )

    assert response.status_code == 422
