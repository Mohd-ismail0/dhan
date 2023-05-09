import 'package:dhanda_app/core/enums/enums.dart';
import 'package:dhanda_app/features/auth/controller/auth_controller.dart';
import 'package:dhanda_app/features/splash/screens/onboarding_screen.dart';
import 'package:dhanda_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationScreen extends ConsumerWidget {
  final AuthType authType;
  RegistrationScreen({super.key, required this.authType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYvkNcVrT9_lGjDvqcfy5gp35R5Hj_mgA1Xpe8PvMxCQ&usqp=CAU&ec=48600113",
            height: height * 0.2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Registration',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Enter Your Mobile Number to\nRecieve A Verification Code",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.kGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: AppTheme.kGrey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10)
                ]),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.flag),
                                suffixIcon: Icon(
                                  Icons.check_outlined,
                                  color: AppTheme.kDarkGreen,
                                ),
                                enabledBorder: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          OnboardingButton(
                              text: "Get Code",
                              onPressed: () {
                                ref
                                    .read(authControllerProvider)
                                    .phoneSignIn(context, '+917987796282');
                              })
                        ],
                      ),
                    )),
              )
            ],
          )
        ]));
  }
}
