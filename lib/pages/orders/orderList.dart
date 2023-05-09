import 'package:dhanda_app/models/OrderTypeModel.dart';
import 'package:dhanda_app/models/customer_model.dart';
import 'package:dhanda_app/models/order_model.dart';
import 'package:flutter/material.dart';

Customer customer =
    Customer(name: "Customer_Name", address: "temp add", phoneNo: 9876543219);


List<OrderModel> listOfOrders = List.generate(
    20,
    (index) => OrderModel(
        customer: customer,
        type: TypeOfOrder.PendingOrder,
        orderId: "#00000" + index.toString(),
        orderImage: Image(image: AssetImage('assets/images/product-mdpi.png')),
        listOfProducts: []));

        
