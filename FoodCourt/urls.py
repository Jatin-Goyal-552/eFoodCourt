from django.urls import path
from . import views

urlpatterns = [
	path('', views.home, name="home"),
	path('signup/',views.signup, name="signup"),
	path('login/',views.login, name="login"),
	path('test/', views.test, name="test"),
	path('cart/',views.cart, name="cart"),
	path('checkout/', views.checkout, name="checkout"),
	path('addcart/<fid>',views.addcart,name="addcart"),
	path('deletefood/<fid>',views.deletefood,name="deletefood"),
	path('myorders/',views.myorders,name="myorders"),
	path('pendingorders/',views.pendingorders,name="pendingorders"),
	path('admin_home/',views.admin_home,name="admin_home"),
	path('delete/<fid>',views.deletefood,name="delete"),
	path('add_food/',views.add_food,name="add_food"),
	path('allorders/',views.allorders,name="allorders"),
	path('allpendingorders/',views.allpendingorders,name="allpendingorders"),
	path('delivered/<oid>',views.delivered,name="delivered"),
	path('viewdetailscustomer/<oid>',views.viewdetailscustomer,name="viewdetailscustomer"),
	path('viewdetailsadmin/<oid>',views.viewdetailsadmin,name="viewdetailsadmin"),
	path('additem/<fid>',views.additem,name="additem"),
	path('removeitem/<fid>',views.removeitem,name="removeitem")
]