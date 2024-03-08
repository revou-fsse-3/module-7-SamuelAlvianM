from flask import Blueprint, render_template, request, jsonify
from connectors.mysql_connector import Session
from models.review import Review
from sqlalchemy.orm import sessionmaker
from connectors.mysql_connector import engine
from sqlalchemy import  select, or_
from flask_login import current_user, login_required

review_routes = Blueprint('review_routes', __name__)

@review_routes.route("/review", methods=['GET'])
@login_required
def review_home():
    response_data = dict()

    connection = engine.connect()
    Session = sessionmaker(connection)
    session = Session()

    try:
        review_query = select(Review)

        if request.args.get('query') is not None:
            search_query = request.args.get('query')
            review_query = review_query.where(or_(Review.email.like(f"%{search_query}%"), Review.review_content.like(f"%{search_query}%")))

        reviews = session.execute(review_query)
        reviews = reviews.scalars()
        response_data['reviews'] = reviews

    except Exception as e:
        print(e)
        return jsonify({"message": "Something went wrong when processing data"})

    response_data['name'] = current_user.name
    return render_template("reviews/review_home.html", response_data=response_data)

@review_routes.route("/review/<id>", methods=['GET'])
def review_detail(id):
    response_data = dict()
    
    connection = engine.connect()
    Session = sessionmaker(connection)
    session = Session()

    try:
        review = session.query(Review).filter(Review.id == id).first()
        if review is None:
            return jsonify({"message": "Can't find review"})
        response_data['review'] = review
    except Exception as e:
        print(e)
        return jsonify({"message": "Something went wrong when processing data"})

    return render_template("reviews/review_detail.html", response_data=response_data)


