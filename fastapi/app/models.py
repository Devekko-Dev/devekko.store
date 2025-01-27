from sqlmodel import SQLModel, Field
from typing import Optional

class StockPredictionBase(SQLModel):
    ticker: str
    forecast: str
    year: Optional[int] = None

class StockPrediction(StockPredictionBase, table=True):
    id: int = Field(default=None, nullable=False, primary_key=True)

class StockPredictionCreate(StockPredictionBase):
    pass