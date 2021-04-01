from django.db import models

# Create your models here.
class Customer(models.Model):
    cid=models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=100)
    password= models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    phone = models.IntegerField()
    object=models.Manager()

class Food(models.Model):
    fid=models.AutoField(primary_key=True)
    food_name = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    price = models.FloatField()
    rating = models.FloatField()
    image = models.FileField()
    object=models.Manager()

class customer_order(models.Model):
    oid=models.AutoField(primary_key=True)
    cid=models.ForeignKey(Customer,on_delete=models.DO_NOTHING)
    date_ordered = models.DateTimeField(auto_now_add=True)
    complete = models.BooleanField(default=False)
    # transaction_id = models.CharField(max_length=100, null=True)
    order_amount= models.FloatField(null=True)
    object=models.Manager()

class food_order(models.Model):
    oid=models.ForeignKey(customer_order,on_delete=models.DO_NOTHING)
    fid=models.ForeignKey(Food, on_delete=models.DO_NOTHING)
    quantity=models.IntegerField()
    object=models.Manager()

class order_delivery(models.Model):
    did=models.AutoField(primary_key=True)
    oid=models.ForeignKey(customer_order,on_delete=models.DO_NOTHING)
    cid=models.ForeignKey(Customer,on_delete=models.DO_NOTHING)
    address = models.CharField(max_length=200)
    city = models.CharField(max_length=200)
    state = models.CharField(max_length=200)
    zipcode = models.CharField(max_length=200)
    card_no=models.IntegerField(null=True)
    cvv=models.IntegerField(null=True)
    expirydate=models.CharField(max_length=20,null=True)
    object=models.Manager()

class Admin(models.Model):
    aid=models.AutoField(primary_key=True)
    admin_name = models.CharField(max_length=100)
    admin_password= models.CharField(max_length=200)
    admin_email = models.CharField(max_length=200)
    admin_phone = models.IntegerField()
    object=models.Manager()

class addfood(models.Model):
    addfoodid=models.AutoField(primary_key=True)
    ad_id=models.ForeignKey(Admin,on_delete=models.DO_NOTHING)
    food_id=models.ForeignKey(Food,on_delete=models.DO_NOTHING)
    object=models.Manager()


