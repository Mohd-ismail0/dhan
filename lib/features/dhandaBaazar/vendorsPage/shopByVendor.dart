import 'package:dhanda_app/features/dhandaBaazar/vendorsPage/vendorInfo.dart';
import 'package:dhanda_app/features/dhandaBaazar/vendorsPage/vendorWidget.dart';
import 'package:flutter/material.dart';

class shopByVendor extends StatelessWidget {
  const shopByVendor({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeVertical = MediaQuery.of(context).size.height;
    var sizeHorizontal = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop by Vendor",
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 25),
        ),
        centerTitle: true,
        toolbarHeight: 72,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            iconSize: 35,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Color.fromRGBO(9, 151, 153, 1),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/Menu.png",
            ),
            iconSize: 25,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Text(
              "Your Vendors",
              style: TextStyle(
                  fontSize: sizeVertical * 0.03,
                  color: Color(0xff0B5F5A),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: sizeVertical,
              child: ListView.builder(
                itemCount: vendorInfo.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: vendorWidget(
                      vendorName: vendorInfo[index]['vendorName'].toString(),
                      vendorOrgName: vendorInfo[index]['name'].toString(),
                      vendorPhone: vendorInfo[index]['phoneNo'].toString(),
                      cateogry: vendorInfo[index]['category'].toString(),
                      lastPurchase: vendorInfo[index]['lastPurchase'].toString(),
                      index: index,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
