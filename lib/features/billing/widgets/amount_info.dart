import 'package:dhanda_app/features/billing/controller/billing_controller.dart';
import 'package:dhanda_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class AmountInfo extends ConsumerWidget {
  AmountInfo({Key? key}) : super(key: key);

  TextEditingController _disCont = TextEditingController(text: '0');

  _setDiscount(WidgetRef ref, double discount) {
    ref.read(billingControllerProvider).setDiscount(discount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double subTotal = ref.watch(billingControllerProvider).subTotal;
    double totalAmount = ref.watch(billingControllerProvider).totalAmount;
    double discount = ref.read(billingControllerProvider).discountAmount;
    _disCont.value = TextEditingValue(text: discount.toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          "Sub Total :  $subTotal",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Discount: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
                height: 35,
                width: 120,
                child: TextField(
                  controller: _disCont,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(color: AppTheme.kLightGreen, width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(color: AppTheme.kBlack, width: 2)),
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: AppTheme.kYellow,
              onPressed: () => _setDiscount(
                  ref,
                  _disCont.text.trim().length == 0
                      ? 0
                      : double.parse(_disCont.text)),
              child: Text("Apply"),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Total Amount :  $totalAmount",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppTheme.kDarkGreen),
        ),
      ],
    );
  }
}
