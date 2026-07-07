from sqlalchemy import create_engine, text
import os
from dotenv import load_dotenv


def get_engine():
    """
    Creates and returns a SQLAlchemy engine for the PostgreSQL database.
    """
    load_dotenv()

    DB_USER = os.getenv("DB_USER")
    DB_PASSWORD = os.getenv("DB_PASSWORD")
    DB_HOST = os.getenv("DB_HOST")
    DB_PORT = os.getenv("DB_PORT")
    DB_NAME = os.getenv("DB_NAME")

    DATABASE_URL = (
        f"postgresql+psycopg://"
        f"{DB_USER}:{DB_PASSWORD}@"
        f"{DB_HOST}:{DB_PORT}/"
        f"{DB_NAME}"
    )

    engine = create_engine(DATABASE_URL)
    return engine    