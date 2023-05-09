import 'dart:convert';

import 'package:dhanda_app/core/constants/image_constants.dart';
import 'package:dhanda_app/features/billing/controller/billing_controller.dart';
import 'package:dhanda_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

// ignore: must_be_immutable
class ScannerImage extends ConsumerWidget {
  ScannerImage({Key? key}) : super(key: key);

  MobileScannerController cameraController = MobileScannerController();

  _addProduct(String code, WidgetRef ref) {
    try {
      double barcode = double.tryParse(code)!;
      ref.read(billingControllerProvider).getProductDetails(barcode);
    } catch (e) {
      print("EEEE $e");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // padding: EdgeInsets.all(10),

      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              scale: 0.25, image: AssetImage(ImageConstants.barcodeScan)),
          border: Border.all(
            width: 2,
            color: AppTheme.kLightGreen,
          )),
      child: MobileScanner(
        controller: cameraController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          cameraController.stop();

          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
            _addProduct(barcode.rawValue!, ref);
          }
          Future.delayed(Duration(seconds: 2), () {
            cameraController.start();
          });
        },
      ),
    );
  }

  // ignore: unused_element
  _addProductPopUp(String productData) {
    try {
      var productDataJson = jsonDecode(productData);
      print(productDataJson);

      print(productDataJson["productName"]);

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text("${productDataJson["productName"]}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 15,
            ),
            Text(
              "Variations",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                ...(productDataJson["variations"] as List<dynamic>)
                    .map((eachVar) => Card(
                          child: ListTile(
                            tileColor: AppTheme.kYellow,
                            leading: Icon(Icons.list_alt),
                            title: Text(
                              "${eachVar["productWeight"]}",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            trailing: Text(
                              "₹${eachVar["productMrp"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ))
                    .toList()
              ],
            )
          ],
        ),
      );
    // ignore: unused_catch_clause
    } on Exception catch (e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text("Product Data not in correct format"),
      );
    }
  }
}
