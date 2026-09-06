import pytest
from app.main import app

@pytest.fixture()
def client():
    app.config.update(TESTING=True)
    with app.test_client() as client:
        yield client

def test_health(client):
    response = client.get('/healthz')
    assert response.status_code == 200
    assert response.json['status'] == 'ok'

def test_version(client):
    response = client.get('/api/v1/version')
    assert response.status_code == 200
    assert response.json['service'] == 'secure-demo'
