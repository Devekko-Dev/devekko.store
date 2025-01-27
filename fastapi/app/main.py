from fastapi import Depends, FastAPI, HTTPException
from sqlmodel import select
from sqlmodel.ext.asyncio.session import AsyncSession
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

from app.db import get_session, init_db
from app.models import StockPrediction, StockPredictionCreate
from app.model import convert, predict

app = FastAPI()

origins = [
    "http://localhost.tiangolo.com",
    "https://localhost.tiangolo.com",
    "http://localhost",
    "exp://10.0.0.100:8081",
    "exp://10.0.0.100",
    "exp://*",
    "http://localhost:8081",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class StockIn(BaseModel):
    ticker: str


class StockOut(StockIn):
    forecast: dict

@app.get("/ping")
async def pong():
    return {"ping": "pong"}

@app.post("/predict", response_model=StockOut, status_code=200)
def get_prediction(payload: StockIn):
    ticker = payload.ticker

    prediction_list = predict(ticker)

    if not prediction_list:
        raise HTTPException(status_code=400, detail="Model not found.")

    response_object = {"ticker": ticker, "forecast": convert(prediction_list)}
    return response_object

@app.get("/predict/stocks", response_model=list[StockPrediction])
async def get_stock_predictions(session: AsyncSession = Depends(get_session)):
    result = await session.execute(select(StockPrediction))
    stockpredictions = result.scalars().all()
    return [StockPrediction(ticker=stockprediction.ticker, forecast=stockprediction.forecast, id=stockprediction.id) for stockprediction in stockpredictions]


@app.post("/predict/stocks")
async def add_stock_prediction(stockprediction: StockPredictionCreate, session: AsyncSession = Depends(get_session)):
    stockprediction = StockPrediction(ticker=stockprediction.ticker, forecast=stockprediction.forecast)
    session.add(stockprediction)
    await session.commit()
    await session.refresh(stockprediction)
    return stockprediction
