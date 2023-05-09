import 'package:dhanda_app/core/constants/image_constants.dart';
import 'package:dhanda_app/features/billing/controller/billing_controller.dart';
import 'package:dhanda_app/models/products_model.dart';
import 'package:dhanda_app/routes/app_route.dart';
import 'package:dhanda_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class BillDetailsScreen extends ConsumerWidget {
  BillDetailsScreen({Key? key}) : super(key: key);

  String? customerName;
  String? phone;

  List<ProductsModel> productsModel = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    productsModel = ref.read(billingControllerProvider).productsModelList;
    customerName = ref.read(billingControllerProvider).customerName;
    phone = ref.read(billingControllerProvider).customerPhone;

    return Scaffold(
      appBar:
          // App Bar : Payment Collection
          AppBar(
        centerTitle: true,
        toolbarHeight: 72,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.popUntil(
              context, (route) => AppRoute.home == route.settings.name),
        ),
        title: Text(
          "Bill #00001",
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 22),
        ),
        backgroundColor: AppTheme.kLightGreen,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            iconSize: 25.0,
            icon: Image.asset(ImageConstants.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: ListView(
            // direction: Axis.vertical,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Customer Name : ${customerName ?? ''}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.kLightGreen,
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Phone : ${phone ?? ''}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.kLightGreen,
                    fontSize:
                        Theme.of(context).textTheme.titleMedium!.fontSize),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Date : 30/03/23",
                    style: TextStyle(
                        color: AppTheme.kRed,
                        fontSize:
                            Theme.of(context).textTheme.titleSmall!.fontSize),
                  ),
                  Text("Time : 9:60 pm",
                      style: TextStyle(
                          color: AppTheme.kRed,
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .fontSize)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                  columnWidths: {
                    0: IntrinsicColumnWidth(flex: 3),
                    1: IntrinsicColumnWidth(flex: 1),
                    2: IntrinsicColumnWidth(flex: 1),
                    3: IntrinsicColumnWidth(flex: 1),
                    4: IntrinsicColumnWidth(flex: 1),
                  },
                  border: TableBorder
                      .all(), // Allows to add a border decoration around your table
                  children: [
                    TableRow(children: [
                      Text(
                        '  Product',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Qty',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Price',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "GST",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Total",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]),
                    ...productsModel
                        .map(
                          (productModel) => TableRow(children: [
                            Text(
                              "  " + productModel.brandName,
                            ),
                            Text(
                              '${productModel.productQuantity}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${productModel.mrp * productModel.productQuantity}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${productModel.mrp * productModel.tax / 100 * productModel.productQuantity}',
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${(productModel.mrp * productModel.tax / 100 * productModel.productQuantity) + (productModel.mrp * productModel.productQuantity)}',
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        )
                        .toList()
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
