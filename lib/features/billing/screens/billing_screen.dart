import 'package:dhanda_app/core/common/custom_button.dart';
import 'package:dhanda_app/core/constants/image_constants.dart';
import 'package:dhanda_app/features/billing/controller/billing_controller.dart';
import 'package:dhanda_app/features/billing/widgets/products_listview.dart';
import 'package:dhanda_app/features/billing/widgets/scanner_image.dart';
import 'package:dhanda_app/features/billing/widgets/search_section.dart';
import 'package:dhanda_app/models/products_model.dart';
import 'package:dhanda_app/routes/app_route.dart';
import 'package:dhanda_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class BillingScreen extends ConsumerWidget {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  List<ProductsModel> productList = [];

  _fetchProductData(WidgetRef ref) {
    ref
        .read(billingControllerProvider.notifier)
        .getProductDetails(8904083516439);
  }

  _collectPayment(BuildContext context, WidgetRef ref) {
    if (ref.read(billingControllerProvider).productsModelList.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        content: Text('No Product in Cart'),
      ));
    } else {
      ref.read(billingControllerProvider.notifier)
        ..setSubTotalAmount()
        ..setTotalAmount();
      Navigator.pushNamed(context, AppRoute.paymentCollection);
    }
  }

  _resetBilling(WidgetRef ref) {
    ref.read(billingControllerProvider).initial();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        _resetBilling(ref);
        return true;
      },
      child: Scaffold(
          key: _key,
          appBar:
              //App Bar : New Bill
              AppBar(
            centerTitle: true,
            toolbarHeight: 72,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 30),
              onPressed: () {
                Navigator.of(context).pop();
                _resetBilling(ref);
              },
            ),
            title: Text(
              "New Bill",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 25),
            ),
            backgroundColor: AppTheme.kLightGreen,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  _fetchProductData(ref);
                },
                iconSize: 25.0,
                icon: Image.asset(ImageConstants.menu),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),

                //Add the product by searching or voice assistant
                SearchSectionWidget(),
                SizedBox(
                  height: 20,
                ),

                //Scan the product and add to billing
                ScannerImage(),
                SizedBox(
                  height: 40,
                ),

                //List of products added to billing
                ProductsListView(),
                SizedBox(
                  height: 40,
                ),

                //Button to got to Payment Collection Screen showing various pay methods and other stuffs
                CustomButton(
                    text: "₹ Collect Payment",
                    onPressed: () => _collectPayment(context, ref)),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          )),
    );
  }
}
