// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dhanda_app/models/products_model.dart';

class BillModel {
  String? customerName;
  String? customerPhone;
  String date;
  String time;
  String paymentMethod;
  List<ProductsModel> products;
  BillModel({
    this.customerName,
    this.customerPhone,
    required this.date,
    required this.time,
    required this.paymentMethod,
    required this.products,
  });

  BillModel copyWith({
    String? customerName,
    String? customerPhone,
    String? date,
    String? time,
    String? paymentMethod,
    List<ProductsModel>? products,
  }) {
    return BillModel(
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      date: date ?? this.date,
      time: time ?? this.time,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerName': customerName,
      'customerPhone': customerPhone,
      'date': date,
      'time': time,
      'paymentMethod': paymentMethod,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory BillModel.fromMap(Map<String, dynamic> map) {
    return BillModel(
      customerName:
          map['customerName'] != null ? map['customerName'] as String : null,
      customerPhone:
          map['customerPhone'] != null ? map['customerPhone'] as String : null,
      date: map['date'] as String,
      time: map['time'] as String,
      paymentMethod: map['paymentMethod'] as String,
      products: List<ProductsModel>.from(
        (map['products'] as List<int>).map<ProductsModel>(
          (x) => ProductsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BillModel.fromJson(String source) =>
      BillModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BillModel(customerName: $customerName, customerPhone: $customerPhone, date: $date, time: $time, paymentMethod: $paymentMethod, products: $products)';
  }

  @override
  bool operator ==(covariant BillModel other) {
    if (identical(this, other)) return true;

    return other.customerName == customerName &&
        other.customerPhone == customerPhone &&
        other.date == date &&
        other.time == time &&
        other.paymentMethod == paymentMethod &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return customerName.hashCode ^
        customerPhone.hashCode ^
        date.hashCode ^
        time.hashCode ^
        paymentMethod.hashCode ^
        products.hashCode;
  }
}
