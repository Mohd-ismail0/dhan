import 'package:dhanda_app/core/enums/enums.dart';
import 'package:dhanda_app/features/billing/repository/billing_repository.dart';
import 'package:dhanda_app/models/bill_model.dart';
import 'package:dhanda_app/models/products_model.dart';
import 'package:dhanda_app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//BillingControllerProvider
final billingControllerProvider = ChangeNotifierProvider<BillingController>(
    (ref) => BillingController(
        billingRepository: ref.read(billingRepositoryProvider)));

//BillingController
class BillingController extends ChangeNotifier implements BillingFunctions {
  BillingRepository _billingRepository;
  BillingController({required BillingRepository billingRepository})
      : _billingRepository = billingRepository;

  //Data Variables
  List<ProductsModel> productsModelList = [];
  double subTotal = 0;
  double discountAmount = 0;
  double totalAmount = 0;
  PaymentOption currentPaymentOption = PaymentOption.cash;
  String? customerName;
  String? customerPhone;

  @override
  void initial() {
    subTotal = 0;
    discountAmount = 0;
    totalAmount = 0;
    productsModelList = [];
    currentPaymentOption = PaymentOption.cash;
    customerName = "";
    customerPhone = "";
  }

  //Function to call repositoy to get product data

  @override
  Future<void> getProductDetails(double barcode) async {
    int isAlready = isProductAlreadyInCart(barcode);
    if (isAlready == -1) {
      final product = await _billingRepository.getProductDetail(barcode);
      product.fold((error) => print, (productsModel) {
        print(productsModel);
        productsModelList.add(productsModel);
        notifyListeners();
      });
    } else {
      increaseQuantity(isAlready);
    }
  }

  @override
  double getDiscountAmount() {
    return discountAmount;
  }

  @override
  changePaymentMethod(PaymentOption option) {
    currentPaymentOption = option;
    notifyListeners();
  }

  @override
  void increaseQuantity(int index) {
    int currentQuantity = productsModelList[index].productQuantity;
    currentQuantity++;
    productsModelList[index].productQuantity = currentQuantity;
    notifyListeners();
  }

  @override
  void setDiscount(double discount) {
    discountAmount = discount;
    setTotalAmount();
  }

  @override
  void setTotalAmount() {
    totalAmount = subTotal - discountAmount;
    notifyListeners();
  }

  @override
  double getSubTotalAmount() {
    return subTotal;
  }

  @override
  double getTotalAmount() {
    return totalAmount;
  }

  @override
  void decreaseQuantity(int index) {
    int currentQuantity = productsModelList[index].productQuantity;

    //  print(state[index].productQuantity);
    if (currentQuantity > 1) {
      currentQuantity--;
      productsModelList[index].productQuantity = currentQuantity;
      //state = productsModelList.toList();
      notifyListeners();
    }
  }

  @override
  void removeProduct(int index) {
    productsModelList.removeAt(index);
    notifyListeners();
  }

  @override
  void setSubTotalAmount() {
    subTotal = 0;
    for (var e in productsModelList) {
      subTotal +=
          e.productQuantity * e.mrp + e.productQuantity * e.mrp * (e.tax / 100);
    }
  }

  @override
  int isProductAlreadyInCart(double barcode) {
    return productsModelList
        .indexWhere((element) => element.barcode == barcode);
  }

  @override
  Future<void> generateBill(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Generating bill and Saving on Server'),
    ));
    bool isUploaded = await _billingRepository.uploadBillData(BillModel(
        date: "30/10/23",
        time: "4.20pm",
        paymentMethod: currentPaymentOption.value,
        products: productsModelList));
    print(isUploaded);
    if (isUploaded == true) {
      Navigator.pushNamed(context, AppRoute.billDetail);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Some error'),
      ));
    }
  }
}

abstract class BillingFunctions {
  //set reset parameters when new billing
  void initial() {}

  //getting product info
  Future<void> getProductDetails(double barcode);
  int isProductAlreadyInCart(double barcode);

  //Modifying product quantity or deleting a product
  void increaseQuantity(int index);
  void decreaseQuantity(int index);
  void removeProduct(int index);

  //Payment Method Change
  void changePaymentMethod(PaymentOption option);

  //Amount Info get,set
  void setDiscount(double discount);
  void setTotalAmount();
  void setSubTotalAmount();
  double getTotalAmount();
  double getDiscountAmount();
  double getSubTotalAmount();

  //billing
  void generateBill(BuildContext context);
}
