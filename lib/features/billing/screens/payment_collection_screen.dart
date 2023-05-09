import 'package:dhanda_app/core/common/custom_button.dart';
import 'package:dhanda_app/core/common/custom_textfield.dart';
import 'package:dhanda_app/core/constants/image_constants.dart';
import 'package:dhanda_app/features/billing/controller/billing_controller.dart';
import 'package:dhanda_app/features/billing/widgets/amount_info.dart';

import 'package:dhanda_app/features/billing/widgets/payment_methods.dart';
import 'package:dhanda_app/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class PaymentCollectionScreen extends ConsumerWidget {
  PaymentCollectionScreen({Key? key}) : super(key: key);

  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _customerPhoneController = TextEditingController();

  _collect(BuildContext context, WidgetRef ref) {
    ref.read(billingControllerProvider).customerName =
        _customerNameController.text;
    ref.read(billingControllerProvider).customerPhone =
        _customerPhoneController.text;
    ref.read(billingControllerProvider).generateBill(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar:
          // App Bar : Payment Collection
          AppBar(
        centerTitle: true,
        toolbarHeight: 72,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            Text(
              "Payment Collections",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 22),
            ),
            Text(
              "######",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 16),
            ),
          ],
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

              //Asking for customer name
              CustomTextField(
                  controller: _customerNameController,
                  hintText: "Customer Name(Optional)"),
              SizedBox(
                height: 10,
              ),

              //Asking for Customer Phone num
              CustomTextField(
                  controller: _customerPhoneController,
                  hintText: "Customer Phone(Optional)"),
              SizedBox(
                height: 20,
              ),
              //Provide way to select different payment methods
              PaymentMethods(),
              SizedBox(
                height: 20,
              ),

              // Showing sub total , discount and total amount
              AmountInfo(),
              SizedBox(
                height: 25,
              ),

              //Button to collect final payment  and generate bill
              CustomButton(
                  text: "₹ Collect", onPressed: () => _collect(context, ref))
            ],
          ),
        ),
      ),
    );
  }
}
