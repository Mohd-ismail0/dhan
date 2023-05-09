import 'package:dhanda_app/NavBar/navBarWidgets.dart';
import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget { 
  final String name;
  final String gstin;
  final String date;
  const HomeNavBar(
      {required this.name, required this.gstin, required this.date}); 

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xff099799),
              height: (screenSize.height < 690)? screenSize.height * 0.73 : screenSize.height * 0.63,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: screenSize.height * 0.04),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: screenSize.width * 0.08,
                          color: Colors.white,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.manage_accounts_outlined,
                                color: Colors.black,
                              ),
                              Text(
                                "Profile Settings",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: screenSize.width * 0.18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.store_outlined,
                      color: Colors.red,
                      size: screenSize.height * 0.13,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenSize.height * 0.03,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "GSTIN: $gstin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.height * 0.015,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 20, right: 20),
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.height * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SideBarBox(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.05,
                        title: "Total Sales",
                        titleStyle: TextStyle(
                            fontSize: screenSize.height * 0.018,
                            color: Colors.black),
                        subtitle: "₹32561",
                        subtitleStyle: TextStyle(
                            fontSize: screenSize.height * 0.015,
                            color: Colors.red),
                        backgroundColor: Colors.white,
                      ),
                      SideBarBox(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.05,
                        title: "Total Orders",
                        titleStyle: TextStyle(
                            fontSize: screenSize.height * 0.018,
                            color: Colors.black),
                        subtitle: "1251",
                        subtitleStyle: TextStyle(
                            fontSize: screenSize.height * 0.015,
                            color: Colors.red),
                        backgroundColor: Colors.white,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 20, right: 20),
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SideBarBox(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.05,
                        title: "Credit Given",
                        titleStyle: TextStyle(
                            fontSize: screenSize.height * 0.018,
                            color: Colors.black),
                        subtitle: "₹2051",
                        subtitleStyle: TextStyle(
                            fontSize: screenSize.height * 0.015,
                            color: Colors.black),
                        backgroundColor: Colors.amber,
                      ),
                      SideBarBox(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.05,
                        title: "Credit Taken",
                        titleStyle: TextStyle(
                            fontSize: screenSize.height * 0.018,
                            color: Colors.white),
                        subtitle: "₹12089",
                        subtitleStyle: TextStyle(
                            fontSize: screenSize.height * 0.015,
                            color: Colors.white),
                        backgroundColor: Colors.red.shade900,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.37,
              child: ListView(
                children: [
                  NavBarTiles(leadIcon: Icon(Icons.home), title: "Home", titleStyle: TextStyle()),
                  NavBarTiles(leadIcon: Icon(Icons.home), title: "Home", titleStyle: TextStyle()),
                  NavBarTiles(leadIcon: Icon(Icons.home), title: "Home", titleStyle: TextStyle()),
                  NavBarTiles(leadIcon: Icon(Icons.home), title: "Home", titleStyle: TextStyle()),
                  NavBarTiles(leadIcon: Icon(Icons.home), title: "Home", titleStyle: TextStyle()),
                  NavBarTiles(leadIcon: Icon(Icons.home), title: "Home", titleStyle: TextStyle()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
