import 'package:dhanda_app/routes/app_route.dart';
import 'package:dhanda_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<Map<String, String>> _languageList = [
    {"local": "English", "english": "English"},
    {"local": "हिन्दी", "english": "Hindi"},
    {"local": "বাংলা", "english": "Bengali"},
    {"local": "English", "english": "English"},
    {"local": "हिन्दी", "english": "Hindi"},
    {"local": "বাংলা", "english": "Bengali"},
    {"local": "English", "english": "English"},
    {"local": "हिन्दी", "english": "Hindi"},
    {"local": "বাংলা", "english": "Bengali"},
    {"local": "English", "english": "English"},
    {"local": "हिन्दी", "english": "Hindi"},
    {"local": "বাংলা", "english": "Bengali"},
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onboardOne() {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Text(
                "Dhanda App",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.kDarkGreen,
                    shadows: [
                      BoxShadow(
                          color: AppTheme.kLightGreen.withOpacity(0.5),
                          offset: Offset(0, 0),
                          blurRadius: 50,
                          spreadRadius: 5)
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Your digital store manager",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.kRed),
              ),
            ],
          ),
        ),
        Container(
          height: height * 0.1,
          child: OnboardingDotContainer(currentIndex: _currentIndex),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        OnboardingButton(
          text: "Proceed",
          onPressed: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
        )
      ],
    );
  }

  _onboardTwo() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: height * 0.55,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: height * 0.05, horizontal: 20),
          padding:
              EdgeInsets.symmetric(vertical: height * 0.025, horizontal: 10),
          decoration: BoxDecoration(
              color: AppTheme.kYellow.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.kLightGreen, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Select Your Preferred Language",
                style: TextStyle(
                    color: AppTheme.kDarkGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.05),
                    itemCount: _languageList.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: height * 0.1,
                        mainAxisExtent: height * 0.08,
                        crossAxisSpacing: width * 0.05,
                        mainAxisSpacing: height * 0.03),
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppTheme.kLightGreen, width: 2)),
                          child: GridTile(
                            child: Center(
                              child: Text(
                                "${_languageList[index]["local"]}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ),
                            footer: Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Text(
                                "${_languageList[index]["english"]}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ));
                    }),
              )
            ],
          ),
        ),
        Container(
          height: height * 0.1,
          child: OnboardingDotContainer(currentIndex: _currentIndex),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        OnboardingButton(
          text: "Next",
          onPressed: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
        )
      ],
    );
  }

  _onboardThree() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: height * 0.65,
          padding: EdgeInsets.symmetric(horizontal: width * 0.12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "One App For All Your Business Needs",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.5,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.kDarkGreen),
              ),
            ],
          ),
        ),
        Container(
          height: height * 0.1,
          child: OnboardingDotContainer(currentIndex: _currentIndex),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        OnboardingButton(
          text: "Next",
          onPressed: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
        )
      ],
    );
  }

  _onboardFour() {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYvkNcVrT9_lGjDvqcfy5gp35R5Hj_mgA1Xpe8PvMxCQ&usqp=CAU&ec=48600113",
                height: height * 0.2,
              ),
              Text(
                "Let's Get Started",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.kBlack),
              ),
              Text(
                "Join us Now and Get\nMore Efficient = More Profits",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.5, color: Color.fromARGB(255, 131, 123, 123)),
              ),
            ],
          ),
        ),
        Container(
          height: height * 0.1,
          child: OnboardingDotContainer(currentIndex: _currentIndex),
        ),
        Container(
          height: height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OnboardingButton(
                text: "Create Account",
                onPressed: () => Navigator.pushNamed(context, AppRoute.signup),
              ),
              OnboardingButton(
                text: "Login",
                textColor: AppTheme.kLightGreen,
                buttonColor: AppTheme.kWhite,
                onPressed: () => Navigator.pushNamed(context, AppRoute.login),
              ),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> _onboardingPages() =>
      [_onboardOne(), _onboardTwo(), _onboardThree(), _onboardFour()];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          children: _onboardingPages(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OnboardingDotContainer extends StatelessWidget {
  int currentIndex;
  OnboardingDotContainer({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [0, 1, 2, 3].map((e) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: currentIndex == e ? 7 : 5,
          width: currentIndex == e ? 7 : 5,
          decoration: BoxDecoration(
              color: currentIndex == e ? AppTheme.kLightGreen : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5))),
        );
      }).toList(),
    );
  }
}

// ignore: must_be_immutable
class OnboardingButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  Color? buttonColor;
  Color? textColor;
  OnboardingButton(
      {required this.text,
      required this.onPressed,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialButton(
        minWidth: width * 0.659,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppTheme.kLightGreen),
            borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.symmetric(vertical: 15),
        color: buttonColor ?? AppTheme.kLightGreen,
        textColor: textColor ?? AppTheme.kWhite,
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () => onPressed());
  }
}
