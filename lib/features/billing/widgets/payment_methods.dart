import 'package:dhanda_app/core/enums/enums.dart';
import 'package:dhanda_app/features/billing/controller/billing_controller.dart';

import 'package:dhanda_app/theme/app_theme.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class PaymentMethods extends ConsumerWidget {
  PaymentMethods({Key? key}) : super(key: key);

  PaymentOption groupValue = PaymentOption.card;

  _changePaymentMethod(WidgetRef ref, PaymentOption option) {
    ref.read(billingControllerProvider).changePaymentMethod(option);
  }

  _eachPaymentMethod(WidgetRef ref, PaymentOption paymentOptionType,
      PaymentOption selectedOptionType) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: AppTheme.kGrey),
      )),
      child: Row(
        children: [
          Radio<PaymentOption>(
              activeColor: AppTheme.kLightGreen,
              value: paymentOptionType,
              groupValue: selectedOptionType,
              onChanged: (value) {
                groupValue = value!;
                _changePaymentMethod(ref, groupValue);
              }),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 1,
            height: 50,
            color: AppTheme.kGrey,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            paymentOptionType.value,
            style: TextStyle(
                color: AppTheme.kGrey,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    groupValue = ref.watch(billingControllerProvider).currentPaymentOption;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppTheme.kGrey, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              "Payment Method:",
              style: TextStyle(
                  fontSize: 18,
                  color: AppTheme.kDarkGreen,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _eachPaymentMethod(ref, PaymentOption.cash, groupValue),
          _eachPaymentMethod(ref, PaymentOption.card, groupValue),
          _eachPaymentMethod(ref, PaymentOption.upi_scan_qr, groupValue),
          _eachPaymentMethod(ref, PaymentOption.upi_id, groupValue),
          _eachPaymentMethod(ref, PaymentOption.wallets, groupValue),
          _eachPaymentMethod(ref, PaymentOption.paylater, groupValue)
        ],
      ),
    );
  }
}
