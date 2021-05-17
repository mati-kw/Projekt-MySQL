
from flask import Flask
from flask import Flask, render_template, request, redirect, json
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'MyRestaurant'
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'
mysql.init_app(app)

conn = mysql.connect()
cursor = conn.cursor() #kursor MySQL


# określenie katalogu głównego
@app.route("/") 
def main():
    return render_template('index.html')



# określenie jak ma sie otworzyć strona MakeNewOrder
@app.route('/MakeNewOrder')
def MakeNewOrder():
    cursor.execute("SELECT * FROM pending_orders")
    data = cursor.fetchall()
    return render_template('MakeNewOrder.html',data2 = data)

# określenie zachowania przycisku
@app.route('/MakeNewOrderInput',methods= ['GET','POST'])
def MakeNewOrderInput():

    cursor.execute("SELECT * FROM pending_orders")
    data2 = cursor.fetchall()
    if request.method == "POST":

        req = request.form #zmienna zapytująca o dane z fromularza
        orderId = req.get("MakeNewOrder_orderId") # wyciągnięcie szukanych danych z formularz
        dishId = req.get("MakeNewOrder_dishId")
        cusId = req.get("MakeNewOrder_customerId")

        cursor.callproc('make_order',(orderId,dishId,cusId))
        # print(orderId)
        data = cursor.fetchall()
 
        if len(data) is 0:
            conn.commit()          
        else:
            return json.dumps({'error':str(data[0])})

        return redirect(request.url)

    return render_template("MakeNewOrder.html",data2=data2)





@app.route('/FinalizeOrder')
def FinalizeOrder():
    cursor.execute("SELECT * FROM pending_orders")
    data = cursor.fetchall()
    return render_template('FinalizeOrder.html',data2=data)

@app.route('/FinalizeOrderInput',methods= ['GET','POST'])
def FinalizeOrderInput():
    cursor.execute("SELECT * FROM pending_orders")
    data2 = cursor.fetchall()
    if request.method == "POST":

        req = request.form #zmienna zapytująca o dane z fromularza
        orderId = req.get("FinalizeOrderInput_orderId") # wyciągnięcie szukanych danych z formularz
        empId = req.get("FinalizeOrderInput_empId")
        
        cursor.callproc('finalize_order',(orderId,empId))
        # print(orderId)
        data = cursor.fetchall()
 
        if len(data) is 0:
            conn.commit()          
        else:
            return json.dumps({'error':str(data[0])})

        return redirect(request.url)

    return render_template("FinalizeOrder.html",data2=data2)



@app.route('/MakeSupplyOrder')
def MakeSupplyOrder():
    cursor.execute("SELECT * FROM supply_orders")
    data = cursor.fetchall()
    return render_template('MakeSupplyOrder.html',data2=data)

@app.route('/MakeSupplyOrderInput',methods= ['GET','POST'])
def MakeSupplyOrderInput():
    cursor.execute("SELECT * FROM supply_orders")
    data = cursor.fetchall()
    if request.method == "POST":

        req = request.form #zmienna zapytująca o dane z fromularza
        ShopId = req.get("Shop_Id") # wyciągnięcie szukanych danych z formularz
        EmpId = req.get("Emp_id")
        SupVal = req.get("Sup_val")

        cursor.callproc('make_supply_order',(ShopId,EmpId,SupVal))
        # print(orderId)
        data = cursor.fetchall()
 
        if len(data) is 0:
            conn.commit()          
        else:
            return json.dumps({'error':str(data[0])})

        return redirect(request.url)
    return render_template('MakeSupplyOrder.html',data2 = data)


@app.route("/ManageMenu")
def ManageMenu():
    cursor.execute("SELECT * FROM menu")
    data = cursor.fetchall()
    return render_template("ManageMenu.html",data2=data)

@app.route("/UpdateMenuInput",methods= ['GET','POST'])
def UpdateMenuInput():
    cursor.execute("SELECT * FROM menu")
    data = cursor.fetchall()
    if request.method == "POST":

        req = request.form #zmienna zapytująca o dane z fromularza
        id = req.get("ManageMenu_dishId") # wyciągnięcie szukanych danych z formularz
        dish = req.get("ManageMenu_dish")
        price = req.get("ManageMenu_price")
        veg = req.get("ManageMenu_vegetarian")
        gluten = req.get("ManageMenu_gluten")

        cursor.callproc('update_menu',(id,dish,price,veg,gluten))
        # print(orderId)
        data = cursor.fetchall()
 
        if len(data) is 0:
            conn.commit()          
        else:
            return json.dumps({'error':str(data[0])})

        return redirect(request.url)
    return render_template("ManageMenu.html",data2=data)


@app.route("/AddMenuInput",methods= ['GET','POST'])
def AddMenuInput():
    cursor.execute("SELECT * FROM menu")
    data = cursor.fetchall()
    if request.method == "POST":

        req = request.form #zmienna zapytująca o dane z fromularza
         # wyciągnięcie szukanych danych z formularz
        dish = req.get("ManageMenu_dish")
        price = req.get("ManageMenu_price")
        veg = req.get("ManageMenu_vegetarian")
        gluten = req.get("ManageMenu_gluten")

        cursor.callproc('add_to_menu',(dish,price,veg,gluten))
        # print(orderId)
        data = cursor.fetchall()
 
        if len(data) is 0:
            conn.commit()          
        else:
            return json.dumps({'error':str(data[0])})

        return redirect(request.url)
    return render_template("ManageMenu.html",data2=data)


@app.route("/ManageOrders")
def ManageOrders():
    cursor.execute("SELECT * FROM pending_orders")
    data = cursor.fetchall()
    cursor.execute("SELECT * FROM completed_orders")
    dataC = cursor.fetchall()
    return render_template("ManageOrders.html",data2=data,data3=dataC)

@app.route("/DeletePending",methods= ['GET','POST', 'DELETE'])
def DeletePending():
    cursor.execute("SELECT * FROM pending_orders")
    data = cursor.fetchall()
    cursor.execute("SELECT * FROM completed_orders")
    dataC = cursor.fetchall()
    if request.method == "POST":

        req = request.form #zmienna zapytująca o dane z fromularza
         # wyciągnięcie szukanych danych z formularz
        Id = req.get("ManageMenu_dishId")
        print(type(Id))
        print(Id)
        # cursor.callproc('delete_pending',Id)
        cursor.execute("call delete_pending("+Id+")")
        # print(orderId)
        data = cursor.fetchall()
 
        if len(data) is 0:
            conn.commit()          
        else:
            return json.dumps({'error':str(data[0])})

        return redirect(request.url)
    return render_template("ManageOrders.html",data2=data, data3=dataC)

@app.route("/DeleteFinalized",methods= ['GET','POST', 'DELETE'])
def DeleteFinalized():
    cursor.execute("SELECT * FROM pending_orders")
    dataP = cursor.fetchall()
    cursor.execute("SELECT * FROM completed_orders")
    dataC = cursor.fetchall()
    if request.method == "POST":

        req = request.form #zmienna zapytująca o dane z fromularza
         # wyciągnięcie szukanych danych z formularz
        Id = req.get("ManageMenu_dishId")

        #cursor.callproc('delete_finalized',Id)
        cursor.execute("call delete_finalized("+Id+")")
        # print(orderId)
        data = cursor.fetchall()
 
        if len(data) is 0:
            conn.commit()          
        else:
            return json.dumps({'error':str(data[0])})

        return redirect(request.url)
    return render_template("ManageOrders.html",data2=dataP, data3=dataC)




@app.route("/ViewVegetarian") 
def ViewVegetarian():
    cursor.execute("SELECT * FROM vegetarian_menu")
    data = cursor.fetchall()
    return render_template('ViewVegetarian.html',data2=data)


@app.route("/ViewGlutenFree") 
def ViewGlutenFree():
    cursor.execute("SELECT * FROM vegetarian_menu")
    data = cursor.fetchall()
    return render_template('ViewGlutenFree.html',data2=data)

@app.route("/ViewEmployees")
def ViewEmployees():
    cursor.execute("SELECT * FROM employees")
    data = cursor.fetchall()
    return render_template('ViewEmployees.html',data2=data)


@app.route("/ViewMenu")
def ViewMenu():
    cursor.execute("SELECT * FROM menu")
    data = cursor.fetchall()
    return render_template('ViewMenu.html',data2=data)

@app.route("/ViewCustomers")
def ViewCustomers():
    cursor.execute("SELECT * FROM customers")
    data = cursor.fetchall()
    return render_template('ViewCustomers.html',data2=data)

@app.route("/ViewMostPopularDish")  
def ViewMostPopularDish():
    cursor.execute("SELECT * FROM most_popular_dish")
    data = cursor.fetchall()
    return render_template('ViewMostPopularDish.html',data2=data)


@app.route("/ViewFinalized")  
def ViewFinalized():
    cursor.execute("SELECT * FROM completed_orders")
    data = cursor.fetchall()
    return render_template('ViewFinalized.html',data2=data)

if __name__ == "__main__":
    app.run()

