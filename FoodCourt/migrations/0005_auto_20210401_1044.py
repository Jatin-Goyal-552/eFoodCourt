# Generated by Django 2.2.14 on 2021-04-01 05:14

from django.db import migrations, models
import django.db.models.manager


class Migration(migrations.Migration):

    dependencies = [
        ('FoodCourt', '0004_addfood_admin'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='addfood',
            managers=[
                ('object', django.db.models.manager.Manager()),
            ],
        ),
        migrations.AddField(
            model_name='customer_order',
            name='ordered',
            field=models.BooleanField(default=False),
        ),
    ]
