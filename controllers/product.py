from flask import Blueprint, render_template, request
from connectors.mysql_connector import Session

from models.product import Product
from sqlalchemy import select, or_

from flask_login import current_user, login_required

product_routes = Blueprint('product_routes',__name__)

@product_routes.route("/product", methods=['GET'])
@login_required
def product_home():
    response_data = dict()

    session = Session()

    try:
        product_query = select(Product)

        if request.args.get('query') != None:
            search_query = request.args.get('query')
            product_query = product_query.where(or_(Product.name.like(f"%{search_query}%"), Product.description.like(f"%{search_query}%")))

        products = session.execute(product_query)
        products = products.scalars()
        response_data['products'] = products

    except Exception as e:
        print(e)
        return "Error Processing Data"
    
    response_data['name'] = current_user.name
    return render_template("products/product_home.html", response_data = response_data)

@product_routes.route("/product/<int:id>", methods=['GET'])
def product_detail(id):
    response_data = dict()

    session = Session()

    try:
        product = session.query(Product).filter((Product.id==id)).first()
        if (product == None):
            return "Data not found"
        response_data['product'] = product
    except Exception as e:
        print(e)
        return "Error Processing Data"

    return render_template("products/product_detail.html", response_data = response_data)

@product_routes.route("/product", methods=['POST'])
@login_required
def product_insert():
    
    try:
        session = Session()
        session.begin()

        new_product = Product(
            name=request.form['name'],
            price=request.form['price'],
            description=request.form['description']
    )
        
        session.add(new_product)
        session.commit()
        return { "message": "Success insert data"}

    except Exception as e:
            session.rollback()
            return { "message": "Fail to insert data"}
    finally:
        session.close()


@product_routes.route("/product/<int:id>", methods=['DELETE'])
def product_delete(id):

    try:
        session = Session()
        session.begin()

        product = session.query(Product).filter(Product.id==id).first()
        
        if product:
            session.delete(product)
            session.commit()
            return { "message": "Success delete data"}
        else:
            return {"message": "Product not found"}
    except Exception as e:
        session.rollback()
        print(e)
        return { "message": f"Fail to delete data: {str(e)}"}
    finally:
        session.close()
    

@product_routes.route("/product/<id>", methods=['PUT'])
def product_update(id):

    session = Session()
    session.begin()

    try:
        product = session.query(Product).filter(Product.id==id).first()

        product.name = request.form['name']
        product.price = request.form['price']
        product.description = request.form['description']

        session.commit()
    except Exception as e:
        session.rollback()
        return { "message": "Fail to Update data"}
    
    return { "message": "Success updating data"}


