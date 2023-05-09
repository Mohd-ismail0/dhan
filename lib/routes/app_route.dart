import 'package:dhanda_app/core/enums/enums.dart';
import 'package:dhanda_app/features/auth/screens/business_details_screen.dart';
import 'package:dhanda_app/features/auth/screens/identity_details_screen.dart';
import 'package:dhanda_app/features/auth/screens/registration_screen.dart';
import 'package:dhanda_app/features/auth/screens/verification_screen.dart';
import 'package:dhanda_app/features/billing/screens/bill_details_screen.dart';
import 'package:dhanda_app/features/billing/screens/billing_screen.dart';
import 'package:dhanda_app/features/billing/screens/payment_collection_screen.dart';
import 'package:dhanda_app/features/home/screens/home_screen.dart';
import 'package:dhanda_app/features/splash/screens/onboarding_screen.dart';

import 'package:dhanda_app/features/dhandaBaazar/DhandaBaazar.dart';
import 'package:dhanda_app/pages/orders/orders.dart';
import 'package:flutter/material.dart';

class AppRoute {
  //initial
  static const onboarding = '/onboarding';

  //Authentication routes;
  static const login = '/auth/login';
  static const signup = '/auth/signup';
  static const otp = '/auth/otp';
  static const identityDetail = '/auth/signup/indetity-detail';
  static const businessDetail = '/auth/signup/business-detail';

  static const home = '/home';
  static const dhandaBaazar = '/dhandaBaazar';
  static const onlineOrder = '/online-orders';

  //Billing Section Route Info
  static const newBilling = '/new-billing';
  static const paymentCollection = '/new-billing/payment-collection';
  static const billDetail = '/new-billing/payment-collection/bill-detail';

  static Map<String, Widget Function(dynamic context)> routeInfo = {
    onboarding: (context) => OnboardingScreen(),
    login: (context) => RegistrationScreen(authType: AuthType.login),
    signup: (context) => RegistrationScreen(authType: AuthType.signup),
    otp: (context) => OtpVerificationScreen(),
    identityDetail: (context) => IdentityDetailsScreen(),
    businessDetail: (context) => BusinessDetailsScreen(),
    home: (context) => HomeScreen(title: 'Dhanda'),
    onlineOrder: (context) => Orders(),
    dhandaBaazar: (context) => DhandaBaazar(),
    newBilling: (context) => BillingScreen(),
    paymentCollection: (context) => PaymentCollectionScreen(),
    billDetail: (context) => BillDetailsScreen()
  };
}
