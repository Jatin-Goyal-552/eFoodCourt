from django import forms
from FoodCourt.models import Food

class AddFoodForm(forms.Form):
    food_name=forms.CharField(max_length=50,widget=forms.TextInput(attrs={"class":"form-control"}),label="Food Name")
    description=forms.CharField(max_length=100,widget=forms.TextInput(attrs={"class":"form-control"}),label="Food Description")
    price=forms.FloatField(widget=forms.TextInput(attrs={"class":"form-control"}),label="Food Price")
    rating=forms.FloatField(widget=forms.TextInput(attrs={"class":"form-control"}),label="Food Rating")
    image=forms.FileField(max_length=100,widget=forms.FileInput(attrs={"class":"form-control"}),label="Food Image")
