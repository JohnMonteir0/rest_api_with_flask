from application import create_app
import os

if os.getenv("FLASK_DEBUG") == "development":
    app = create_app("config.DevConfig")
else:
    app = create_app("config.ProdConfig")

if __name__ == "__main__":
    # Only enable debug if FLASK_DEBUG=development
    debug_mode = os.getenv("FLASK_DEBUG") == "development"
    app.run(
        debug=debug_mode,
        host="0.0.0.0",
        port=int(os.getenv("PORT", 5000)),
    )
