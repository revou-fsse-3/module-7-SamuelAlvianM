from flask import Blueprint, render_template, request, redirect
from connectors.mysql_connector import engine
from models.user import User
from sqlalchemy.orm import sessionmaker
from flask_login import login_user, logout_user

user_routes_login = Blueprint('user_routes_login',__name__)

@user_routes_login.route("/login", methods=['GET'])
def user_login():
    return render_template("users/login.html")

@user_routes_login.route("/login", methods=['POST'])
def do_user_login():
    connection = engine.connect()
    Session = sessionmaker(connection)
    session = Session()

    try:
        user = session.query(User).filter(User.email==request.form['email']).first()

        if user == None:
            return {"message" : "Email tidak terdaftar"}
        
        if not user.check_password(request.form['password']):
            return {"message" : "Wrong Password"}

        login_user(user, remember=False)
        return redirect('/product')

    except Exception as e:
        return { "message" : "Login Failed"}
    
@user_routes_login.route("/logout", methods=['GET'])
def do_user_logout():
    logout_user()
    return redirect('/')