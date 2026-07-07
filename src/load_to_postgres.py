import pandas as pd
from sqlalchemy import create_engine

# Update these values
USER = "postgres"
PASSWORD = "your_password"
HOST = "localhost"
PORT = "5432"
DATABASE = "credit_card_fraud_db"

engine = create_engine(
    f"postgresql+psycopg2://{USER}:{PASSWORD}@{HOST}:{PORT}/{DATABASE}"
)

df = pd.read_csv("data/creditcard.csv")

df.to_sql(
    "credit_card_transactions",
    engine,
    if_exists="append",
    index=False
)

print("Data loaded successfully!")