from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from FoodCourt.models import Customer,customer_order,food_order,Food,order_delivery,Admin,addfood
# Create your views here.
from django.db import connection
from django.shortcuts import redirect
from django.core.files.storage import FileSystemStorage
from FoodCourt.forms import AddFoodForm
# import time

customer_id=None
order_id=None
number=0
total=0
lst2=[]
quantity=[]
admin_id=[]
def test(request):
    c=connection.cursor() 
    c.execute("SELECT * FROM efoodcourt.foodcourt_customer,efoodcourt.foodcourt_food;")
    lst=[]
    for row in c.fetchall():
        lst.append(row)
    context={
        'customers':lst,
        }
    return render(request,'home.html',context)

def signup(request):
    if request.method == 'POST':
        username = request.POST.get('user')
        print(username)
        password = request.POST.get('password')
        print(password)
        email= request.POST.get('email')
        phone= request.POST.get('phone')
        user=Customer(user_name=username,password=password,email=email,phone=phone)
        user.save()
        return redirect('login')
    return render(request,'signup.html')

def login(request):
    if request.method == 'POST':
        username = request.POST.get('user')
        password=request.POST.get('password')
        customer=Customer.object.filter(user_name=username,password=password)
        print("customer",customer)
        # Content={
        #     'customers': customer,
        # }
        global customer_id
        try:
            customer_id=customer[0].cid
            print("customer_id",customer_id)
        
            return redirect('home')
        except:
            try:
                print("afa")
                admin=Admin.object.filter(admin_name=username,admin_password=password)
                print("Admin",admin)
                global admin_id
                admin_id=admin[0].aid
                print("admin_id",admin_id)
        
                return redirect('admin_home')
            except:
                return redirect('login')
            return redirect('login')

    return render(request, 'login.html')

def admin_home(request):
    global admin_id
    global order_id
    c=connection.cursor()  
    c.execute("SELECT * FROM efoodcourt.foodcourt_food;")
    lst=[]
    for row in c.fetchall():
        lst.append(row)
    context={
        'menu':lst,
        }
    return render(request, 'admin_store.html',context)

def home(request):
    global customer_id
    global order_id
    c=connection.cursor()  
    c.execute("SELECT * FROM efoodcourt.foodcourt_food;")
    lst=[]
    for row in c.fetchall():
        lst.append(row)
    c=connection.cursor()  
    c.execute("SELECT efoodcourt.foodcourt_customer_order.oid FROM efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.cid_id="+str(customer_id)+" and efoodcourt.foodcourt_customer_order.ordered =0 ;")
    i=0
    for row in c.fetchall():
        print("row",row)
        order_id=row[0]
        i+=1
    if i==0:
        co=customer_order(cid_id=customer_id,complete=0)
        co.save()
        order_id=co.oid
        print("order_od",order_id)
    context={
        'menu':lst,
        }
    return render(request,'store.html',context)

def cart(request):
    global customer_id
    global order_id
    global number
    global total
    global lst2
    # customer_id=1
    c=connection.cursor() 
    c.execute("SELECT efoodcourt.foodcourt_food_order.fid_id,efoodcourt.foodcourt_food_order.quantity FROM efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id in ( select efoodcourt.foodcourt_customer_order.oid from efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.cid_id="+str(customer_id)+" and efoodcourt.foodcourt_customer_order.ordered=0);")
    lst=[]
    quantity=[]
    for row in c.fetchall():
        lst.append(row[0])
        quantity.append(row[1])
    print(lst)
    print(quantity)
    lst2=[]
    j=0
    total=0
    number=0

    for i in lst:
        cart=Food.object.filter(fid=i)
        amount=cart[0].price*quantity[j]
        lst2.append([cart[0],quantity[j],amount])
        total=total+amount
        number+=quantity[j]
        j=j+1
    print("fewf")
    print(lst2)
    print("Total amount",total)
    c=connection.cursor() 
    c.execute("update efoodcourt.foodcourt_customer_order set efoodcourt.foodcourt_customer_order.order_amount="+str(total)+" where efoodcourt.foodcourt_customer_order.oid="+str(order_id)+" and efoodcourt.foodcourt_customer_order.cid_id="+str(customer_id)+";")
    
    context={
        'cart':lst2,
        'quantity':quantity,
        'total':total,
        'number':number
        }
    return render(request,'cart.html',context)
    
def checkout(request):
    global total
    global number 
    global lst2
    global quantity
    global customer_id
    global order_id
    if request.method == 'POST':
        address = request.POST.get('address')
        print(address)
        city= request.POST.get('city')
        state= request.POST.get('state')
        zipcode= request.POST.get('zipcode')
        card_no= request.POST.get('card_no')
        cvv= request.POST.get('cvv')
        expirydate= request.POST.get('expirydate')
        od=order_delivery(cid_id=customer_id,oid_id=order_id,address=address,city=city,state=state,zipcode=zipcode,card_no=card_no,cvv=cvv,expirydate=expirydate)
        od.save()
        c=connection.cursor() 
        c.execute("update efoodcourt.foodcourt_customer_order set efoodcourt.foodcourt_customer_order.ordered= 1 where efoodcourt.foodcourt_customer_order.oid="+str(order_id)+" and efoodcourt.foodcourt_customer_order.cid_id="+str(customer_id)+";")
        return render(request, "finish.html")
    context={
        'cart':lst2,
        'quantity':quantity,
        'total':total,
        'number':number
    }
    return render(request,'checkout.html',context)

# def test_cart(request):
#     global customer_id
#     c=connection.cursor() 
#     c.execute("SELECT efoodcourt.foodcourt_food_order.fid FROM efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid in ( select efoodcourt.foodcourt_customer_order.oid from efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.cid_id ="+str(customer_id)+");")
#     lst=[]
#     for row in c.fetchall():
#         lst.append(row[0])
#         print(row)
#     lst2=[]
#     for i in lst:
#         cart=Food.object.filter(fid=i)
#         print(cart[0].food_name)
#         lst2.append(cart)
#     print(lst2)
#     print(lst2[0][0].fid)
#     return HttpResponse("egrg")

# def addcart(request,fid):
#     # customer_order=customer_order(oid=1,complete=0,email=email,phone=phone)
#     # user.save()
#     global customer_id
#     global order_id
#     # customer_id=1
#     food=Food.object.filter(fid=fid)
#     print(food)
#     print(customer_id)
#     cust_od=customer_order.object.filter(oid=order_id,cid=customer_id)
#     print(cust_od)
#     food_cart=food_order(fid=food[0],quantity=1,oid=cust_od[0])
#     food_cart.save()
#     return redirect('cart')

def addcart(request,fid):
    global customer_id
    global order_id
    c=connection.cursor() 
    sql = "INSERT INTO efoodcourt.foodcourt_food_order (quantity, fid_id,oid_id) VALUES (%s, %s,%s)"
    val = (1, fid,order_id)
    c.execute(sql, val)
    connection.commit()
    return redirect('cart')

def deletefood(request,fid):
    global order_id
    print(fid)
    print(order_id)
    # deletefood=food_order.object.filter(fid=fid,oid=order_id)
    # deletefood.delete()
    c=connection.cursor() 
    c.execute("delete from  efoodcourt.foodcourt_food_order where fid_id="+str(fid)+" and  efoodcourt.foodcourt_food_order.oid_id="+str(order_id)+";")
    return redirect('cart')

def delete(request,fid):
    c=connection.cursor() 
    c.execute("delete from  efoodcourt.foodcourt_food where fid_id="+str(fid)+";")
    return redirect('admin_home')

def myorders(request):
    try:
        global order_id
        global customer_id
        c=connection.cursor() 
        # c.execute("SELECT efoodcourt.foodcourt_food_order.fid_id,efoodcourt.foodcourt_food_order.quantity,efoodcourt.foodcourt_food_order.oid_id FROM efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id in ( select efoodcourt.foodcourt_customer_order.oid from efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.cid_id="+str(customer_id)+" and efoodcourt.foodcourt_customer_order.complete=1);")
        c.execute("select efoodcourt.foodcourt_customer_order.oid from efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.cid_id="+str(customer_id)+" and efoodcourt.foodcourt_customer_order.complete=1;")
        final=[]
        # lst=[]
        # quantity=[]
        orderno=[]
        for row in c.fetchall():
            # lst.append(row[0])
            # quantity.append(row[1])
            orderno.append(row[0])
        # print("lst",lst)
        print('order',orderno)
        # print(quantity)
        orderno.sort(reverse=True)
        for i in orderno:
            order_no=i
            c=connection.cursor() 
            c.execute("SELECT efoodcourt.foodcourt_food_order.fid_id,efoodcourt.foodcourt_food_order.quantity,efoodcourt.foodcourt_food_order.oid_id FROM efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id ="+str(i)+" ;")
            ind=[]
            quantity=[]
            for row in c.fetchall():
                ind.append(row[0])
                quantity.append(row[1])
            # print(lst2)
            lst2=[]
            j=0
            total=0
            number=0

            for i in ind:
                cart=Food.object.filter(fid=i)
                amount=cart[0].price*quantity[j]
                lst2.append([cart[0],quantity[j],amount])
                total=total+amount
                number+=quantity[j]
                j=j+1
            print("fewf")
            print("lst2",lst2)
            print("Total amount",total)
            final.append([lst2,total,number,order_no])
            # print("i",i)
        print("final",final)
        context={
            'orders':final,
            'quantity':quantity,
            'total':total,
            'number':number,

            }

        return render(request,'myorder.html',context)
    except Exception as e:
        print(e)
        context={'orders':None,
            'quantity':None,
            'total':None,
            'number':None}
        return render(request,'myorder.html',context)

def pendingorders(request):
    try:
        global order_id
        global customer_id
        c=connection.cursor() 
        # c.execute("SELECT efoodcourt.foodcourt_food_order.fid_id,efoodcourt.foodcourt_food_order.quantity,efoodcourt.foodcourt_food_order.oid_id FROM efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id in ( select efoodcourt.foodcourt_customer_order.oid from efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.cid_id="+str(customer_id)+" and efoodcourt.foodcourt_customer_order.complete=0);")
        c.execute("select efoodcourt.foodcourt_customer_order.oid from efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.cid_id="+str(customer_id)+" and efoodcourt.foodcourt_customer_order.complete=0 and efoodcourt.foodcourt_customer_order.ordered=1;")
        final=[]
        # lst=[]
        # quantity=[]
        orderno=[]
        for row in c.fetchall():
            # lst.append(row[0])
            # quantity.append(row[1])
            orderno.append(row[0])
        # print("lst",lst)
        print('order',orderno)
        # print(quantity)
        # orderno= list(set(orderno))

        for i in orderno:
            order_no=i
            c=connection.cursor() 
            c.execute("SELECT efoodcourt.foodcourt_food_order.fid_id,efoodcourt.foodcourt_food_order.quantity,efoodcourt.foodcourt_food_order.oid_id FROM efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id ="+str(i)+" ;")
            ind=[]
            quantity=[]
            for row in c.fetchall():
                ind.append(row[0])
                quantity.append(row[1])
            # print(lst2)
            lst2=[]
            j=0
            total=0
            number=0

            for i in ind:
                cart=Food.object.filter(fid=i)
                amount=cart[0].price*quantity[j]
                lst2.append([cart[0],quantity[j],amount])
                total=total+amount
                number+=quantity[j]
                j=j+1
            print("fewf")
            print("lst2",lst2)
            print("Total amount",total)
            final.append([lst2,total,number,order_no])
        print("final",final)
        context={
            'orders':final,
            'quantity':quantity,
            'total':total,
            'number':number
            }

        return render(request,'pendingorders.html',context)
    except:
        context={'orders':None,
            'quantity':None,
            'total':None,
            'number':None}
        return render(request,'pendingorders.html',context)

def add_food(request):
    if request.method=='POST':
        form=AddFoodForm(request.POST,request.FILES)
        if form.is_valid():
            food_name=form.cleaned_data["food_name"]
            description=form.cleaned_data["description"]
            price=form.cleaned_data["price"]
            rating=form.cleaned_data["rating"]
            image=request.FILES['image']
            fs=FileSystemStorage()
            filename=fs.save(image.name,image)
            image_pic_url=fs.url(filename)
            # food=Food(food_name=food_name,description=description,price=price,rating=rating,image=image_pic_url)
            # food.save()
            c=connection.cursor() 
            sql = "INSERT INTO efoodcourt.foodcourt_food (food_name, description,price,rating,image) VALUES (%s, %s,%s,%s,%s)"
            val = (food_name, description, price, rating, image_pic_url)
            c.execute(sql, val)
            connection.commit()
            global admin_id
            print("admin__id",admin_id)
            # time.sleep(20)
            food=Food.object.filter(food_name=food_name)
            # c=connection.cursor() 
            # c.execute("select efoodcourt.foodcourt_food.fid from efoodcourt.foodcourt_food where efoodcourt.foodcourt_food.food_name= "+str(food_name)+" ;")
            # admin=Admin.object.filter(aid=admin_id)
            # for row in c.fetchall():
            #     food=row[0]
            print("food",food[0].fid)
            fid=food[0].fid
            c=connection.cursor() 
            sql = "INSERT INTO efoodcourt.foodcourt_addfood (ad_id_id,food_id_id) VALUES (%s, %s)"
            val = (admin_id,fid)
            c.execute(sql, val)
            connection.commit()
            return redirect('admin_home')
    else:
        form=AddFoodForm(request.POST)
        return render(request,'addfood.html',{"form": form})

def allorders(request):
    global admin_id
    c=connection.cursor() 
    c.execute("select efoodcourt.foodcourt_customer_order.oid,efoodcourt.foodcourt_customer_order.cid_id from efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.complete=1 order by date_ordered desc;")
    ono=[]
    cno=[]
    final=[]
    for row in c.fetchall():
        ono.append(row[0])
        cno.append(row[1])
    print("ono",ono)
    c=connection.cursor()
    k=0
    for i in ono:
        order_no=i
        c=connection.cursor() 
        c.execute("SELECT efoodcourt.foodcourt_food_order.fid_id,efoodcourt.foodcourt_food_order.quantity,efoodcourt.foodcourt_food_order.oid_id FROM efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id ="+str(i)+" ;")
        ind=[]
        quantity=[]
        for row in c.fetchall():
            ind.append(row[0])
            quantity.append(row[1])
        lst2=[]
        j=0
        total=0
        number=0
        # cname=[]
        c=connection.cursor() 
        c.execute("select efoodcourt.foodcourt_customer.user_name from efoodcourt.foodcourt_customer where efoodcourt.foodcourt_customer.cid="+str(cno[k])+ " ;")
        k=k+1
        for row in c.fetchall():
            customer_name =row[0]
        for i in ind:
            cart=Food.object.filter(fid=i)
            amount=cart[0].price*quantity[j]
            lst2.append([cart[0],quantity[j],amount])
            total=total+amount
            number+=quantity[j]
            j=j+1
        print("fewf")
        print("lst2",lst2)
        print("Total amount",total)

        # k=0
        final.append([lst2,total,number,customer_name,order_no])
        # k=k+1
    print("final",final)
    context={
            'orders':final
            # 'quantity':quantity,
            # 'total':total,
            # 'number':number
            }

    return render(request,'allorders.html',context)

def allpendingorders(request):
    try:
        global admin_id
        c=connection.cursor() 
        c.execute("select efoodcourt.foodcourt_customer_order.oid,efoodcourt.foodcourt_customer_order.cid_id from efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.complete=0 and efoodcourt.foodcourt_customer_order.ordered!=0 ;")
        ono=[]
        cno=[]
        final=[]
        for row in c.fetchall():
            ono.append(row[0])
            cno.append(row[1])
        print("ono",ono)
        c=connection.cursor()
        k=0
        z=0
        for i in ono:
            order_no=i
            c=connection.cursor() 
            c.execute("SELECT efoodcourt.foodcourt_food_order.fid_id,efoodcourt.foodcourt_food_order.quantity,efoodcourt.foodcourt_food_order.oid_id FROM efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id ="+str(i)+" ;")
            ind=[]
            quantity=[]
            for row in c.fetchall():
                ind.append(row[0])
                quantity.append(row[1])
            lst2=[]
            j=0
            total=0
            number=0
            # cname=[]
            c=connection.cursor() 
            c.execute("select efoodcourt.foodcourt_customer.user_name from efoodcourt.foodcourt_customer where efoodcourt.foodcourt_customer.cid="+str(cno[k])+ " ;")
            k=k+1
            for row in c.fetchall():
                customer_name =row[0]
            for i in ind:
                cart=Food.object.filter(fid=i)
                amount=cart[0].price*quantity[j]
                lst2.append([cart[0],quantity[j],amount])
                total=total+amount
                number+=quantity[j]
                j=j+1
            print("fewf")
            print("lst2",lst2)
            print("Total amount",total)

            final.append([lst2,total,number,customer_name,ono[z],order_no])
            z=z+1
        print("final",final)
        context={
                'orders':final
                # 'quantity':quantity,
                # 'total':total,
                # 'number':number
                }

        return render(request,'allpendingorders.html',context)
    except:
        # print(e)
        return HttpResponse("<h1>no pending orders</h1>")

def delivered(request,oid):
    
    c=connection.cursor() 
    c.execute("update efoodcourt.foodcourt_customer_order set efoodcourt.foodcourt_customer_order.complete= 1 where efoodcourt.foodcourt_customer_order.oid="+str(oid)+";")
    return redirect('allpendingorders')

def viewdetailscustomer(request,oid):
    print("oid",oid)
    lst1=[]
    lst2=[]
    c=connection.cursor() 
    c.execute("Select * from  efoodcourt.foodcourt_order_delivery where efoodcourt.foodcourt_order_delivery.oid_id= "+str(oid)+";")
    for row in c.fetchall():
            print("row",row)
            lst1.append(row)
    c=connection.cursor() 
    c.execute("Select efoodcourt.foodcourt_customer_order.date_ordered from  efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.oid= "+str(oid)+";")
    for row in c.fetchall():
            print("row",row)
            lst2.append(row)
    context={
        'order_detail':lst1,
        'date':lst2
    }
    return render(request,'orderdetailscustomer.html',context)

def viewdetailsadmin(request,oid):
    print("oid",oid)
    lst1=[]
    lst2=[]
    c=connection.cursor() 
    c.execute("Select * from  efoodcourt.foodcourt_order_delivery where efoodcourt.foodcourt_order_delivery.oid_id= "+str(oid)+";")
    for row in c.fetchall():
            print("row",row)
            lst1.append(row)
    c=connection.cursor() 
    c.execute("Select efoodcourt.foodcourt_customer_order.date_ordered from  efoodcourt.foodcourt_customer_order where efoodcourt.foodcourt_customer_order.oid= "+str(oid)+";")
    for row in c.fetchall():
            print("row",row)
            lst2.append(row)
    context={
        'order_detail':lst1,
        'date':lst2
    }
    return render(request,'orderdetailsadmin.html',context)

def additem(request,fid):
    global order_id
    c=connection.cursor() 
    c.execute("Select quantity from  efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id= "+str(order_id)+" and efoodcourt.foodcourt_food_order.fid_id="+str(fid)+";")
    for row in c.fetchall():
            # print("row",row)
            quantity=row[0]
    print("quantity",quantity)
    quantity=quantity+1
    c=connection.cursor()
    c.execute("Update efoodcourt.foodcourt_food_order set efoodcourt.foodcourt_food_order.quantity="+str(quantity)+" where efoodcourt.foodcourt_food_order.oid_id= "+str(order_id)+" and efoodcourt.foodcourt_food_order.fid_id="+str(fid)+";")
    return redirect('cart')

def removeitem(request,fid):
    global order_id
    c=connection.cursor() 
    c.execute("Select quantity from  efoodcourt.foodcourt_food_order where efoodcourt.foodcourt_food_order.oid_id= "+str(order_id)+" and efoodcourt.foodcourt_food_order.fid_id="+str(fid)+";")
    for row in c.fetchall():
            # print("row",row)
            quantity=row[0]
    print("quantity",quantity)
    quantity=quantity-1
    if quantity==0:
        deletefood(request,fid)
        return redirect('cart')
    c=connection.cursor()
    c.execute("Update efoodcourt.foodcourt_food_order set efoodcourt.foodcourt_food_order.quantity="+str(quantity)+" where efoodcourt.foodcourt_food_order.oid_id= "+str(order_id)+" and efoodcourt.foodcourt_food_order.fid_id="+str(fid)+";")
    return redirect('cart')