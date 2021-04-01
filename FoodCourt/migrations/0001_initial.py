# Generated by Django 2.2.14 on 2021-03-25 06:02

from django.db import migrations, models
import django.db.models.deletion
import django.db.models.manager


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('cid', models.AutoField(primary_key=True, serialize=False)),
                ('user_name', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=200)),
                ('email', models.CharField(max_length=200)),
                ('phone', models.IntegerField()),
            ],
            managers=[
                ('object', django.db.models.manager.Manager()),
            ],
        ),
        migrations.CreateModel(
            name='customer_order',
            fields=[
                ('oid', models.AutoField(primary_key=True, serialize=False)),
                ('date_ordered', models.DateTimeField(auto_now_add=True)),
                ('complete', models.BooleanField(default=False)),
                ('transaction_id', models.CharField(max_length=100, null=True)),
                ('order_amount', models.FloatField(null=True)),
                ('cid', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='FoodCourt.Customer')),
            ],
            managers=[
                ('object', django.db.models.manager.Manager()),
            ],
        ),
        migrations.CreateModel(
            name='Food',
            fields=[
                ('fid', models.AutoField(primary_key=True, serialize=False)),
                ('food_name', models.CharField(max_length=200)),
                ('description', models.CharField(max_length=200)),
                ('price', models.FloatField()),
                ('rating', models.FloatField()),
                ('image', models.FileField(upload_to='')),
            ],
            managers=[
                ('object', django.db.models.manager.Manager()),
            ],
        ),
        migrations.CreateModel(
            name='order_delivery',
            fields=[
                ('did', models.AutoField(primary_key=True, serialize=False)),
                ('address', models.CharField(max_length=200)),
                ('city', models.CharField(max_length=200)),
                ('state', models.CharField(max_length=200)),
                ('zipcode', models.CharField(max_length=200)),
                ('cid', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='FoodCourt.Customer')),
                ('oid', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='FoodCourt.customer_order')),
            ],
            managers=[
                ('object', django.db.models.manager.Manager()),
            ],
        ),
        migrations.CreateModel(
            name='food_order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField()),
                ('fid', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='FoodCourt.Food')),
                ('oid', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='FoodCourt.customer_order')),
            ],
            managers=[
                ('object', django.db.models.manager.Manager()),
            ],
        ),
    ]