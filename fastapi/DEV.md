

async concurency
https://docs.python.org/3/library/asyncio.html
https://magic.io/blog/asyncpg-1m-rows-from-postgres-to-python/
https://github.com/edgedb/edgedb

https://pypi.org/project/alembic/
https://alembic.sqlalchemy.org/en/latest/
https://alembic.sqlalchemy.org/en/latest/tutorial.html


FastAPI SQLModel project structure heavily sourced and inspired by 
https://testdriven.io/blog/fastapi-sqlmodel/


https://testdriven.io/blog/fastapi-machine-learning/




# Microsoft
curl -d '{"ticker":"MSFT", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks

# News Corp
curl -d '{"ticker":"NWS", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks

# Oracle
curl -d '{"ticker":"ORCL", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks

# Tesla
curl -d '{"ticker":"TLSA", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks

# Palantir
curl -d '{"ticker":"PLTR", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks


curl http://localhost:8004/predict/stocks



ML Prediction

https://pystan.readthedocs.io/en/latest/installation.html


docker-compose down -v
docker-compose up -d --build
docker-compose exec fastapi alembic upgrade head
docker-compose logs fastapi

docker-compose up -d --build
docker-compose logs fastapi
curl http://localhost:8004/predict/stocks
curl http://localhost:8004/ping


curl \
  --header "Content-Type: application/json" \
  --request POST \
  --data '{"ticker":"MSFT"}' \
  http://localhost:8008/predict

docker-compose exec fastapi python

from model import train, predict, convert
train()
train("GOOG")
train("AAPL")
train("^GSPC")

# Microsoft
curl -d '{"ticker":"MSFT", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks

# News Corp
curl -d '{"ticker":"NWS", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks

# Oracle
curl -d '{"ticker":"ORCL", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks

# Tesla
curl -d '{"ticker":"TLSA", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks

# Palantir
curl -d '{"ticker":"PLTR", "forecast":"UP"}' -H "Content-Type: application/json" -X POST http://localhost:8004/predict/stocks


curl http://localhost:8004/predict/stocks

curl http://localhost:8004/ping




Inspiration
https://testdriven.io/blog/fastapi-crud/


https://github.com/rafapi/fastapi-prophet
