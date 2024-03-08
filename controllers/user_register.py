from flask import Blueprint, render_template, request, redirect
from connectors.mysql_connector import engine
from models.user import User
from sqlalchemy.orm import sessionmaker
from flask_login import login_user, logout_user

user_routes_register = Blueprint('user_routes_register',__name__)

@user_routes_register.route("/register", methods=['GET'])
def user_register():
    return render_template("users/register.html")

@user_routes_register.route("/register", methods=['POST'])
def do_registration():

    name = request.form['name']
    email = request.form['email']
    password = request.form['password']
    
    NewUser = User(name=name, email=email)
    NewUser.set_password(password)

    connection = engine.connect()
    Session = sessionmaker(connection)
    session = Session()

    session.begin()
    try:
        session.add(NewUser)
        session.commit()
    except Exception as e:
        session.rollback()
        return { "message": "Something Wrong" }
    
    return { "message": "Registration Success, LET'S LOGIN" }