import 'package:dhanda_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'OrderTypeModel.dart';
import 'customer_model.dart';

class OrderModel {
  Image? orderImage;
  TypeOfOrder type;
  final String? orderId;
  final Customer customer;
  final List<ProductsModel> listOfProducts;
  OrderModel(
      {required this.customer,
      required this.type,
      required this.orderId,
      required this.orderImage,
      required this.listOfProducts});
}
