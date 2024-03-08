from dotenv import load_dotenv
from flask import Flask, render_template
from connectors.mysql_connector import engine, connection
from sqlalchemy.orm import sessionmaker
from models.product import Product
from sqlalchemy import select
from flask_login import LoginManager
from models.user import User
import os

# Load Controller Files
from controllers.product import product_routes
from controllers.user_register import user_routes_register
from controllers.user_login import user_routes_login
from controllers.review import review_routes


load_dotenv()

app=Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')

login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(user_id):
    connection = engine.connect()
    Session = sessionmaker(connection)
    session = Session()

    return session.query(User).get(int(user_id))

app.register_blueprint(product_routes)
app.register_blueprint(user_routes_register)
app.register_blueprint(user_routes_login)
app.register_blueprint(review_routes)



# Product Route
@app.route("/")
def hello_world():
    
    product_query = select(Product)
    Session = sessionmaker(connection)
    with Session() as session:
        result = session.execute(product_query)
        for row in result.scalars():
            print(f'ID: {row.id}, Name: {row.name}')

    return render_template('index.html')