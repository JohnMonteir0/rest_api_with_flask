import os


class DevConfig:

    MONGODB_SETTINGS = {
        "db": os.getenv("MONGODB_DB"),
        "host": os.getenv("MONGODB_HOST"),
        "username": os.getenv("MONGODB_USER"),
        "password": os.getenv("MONGODB_PASSWORD"),
    }


class ProdConfig:

    MONGODB_USER = os.getenv("MONGODB_USER")
    MONGODB_PASSWORD = os.getenv("MONGODB_PASSWORD")
    MONGODB_HOST = os.getenv("MONGODB_HOST")
    MONGODB_DB = os.getenv("MONGODB_DB")
    MONGODB_CA_FILE = os.getenv("MONGODB_CA_FILE", "app/application/certs/rds-combined-ca-bundle.pem")

    URI = (
        f"mongodb://{MONGODB_USER}:{MONGODB_PASSWORD}@{MONGODB_HOST}:27017/{MONGODB_DB}"
        "?ssl=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false"
    )
    
    MONGODB_SETTINGS = {
        "host": URI,
        "tlsCAFile": MONGODB_CA_FILE,
    }


class MockConfig:
    @staticmethod
    def get_settings():
        import mongomock
        return {
            "db": "users",
            "host": "mongodb://localhost",
            "mongo_client_class": mongomock.MongoClient,
        }
