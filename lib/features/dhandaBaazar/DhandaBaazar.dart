import 'package:dhanda_app/features/dhandaBaazar/vendorsPage/shopByVendor.dart';
import 'package:flutter/material.dart';

import 'package:dhanda_app/features/dhandaBaazar/dhandaBaazarConsts.dart';
import 'package:dhanda_app/features/dhandaBaazar/dhandaBaazarWidgets.dart';

class DhandaBaazar extends StatelessWidget {
  const DhandaBaazar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeVertical = MediaQuery.of(context).size.height;
    var sizeHorizontal = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Baazar for Dhanda",
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 25),
        ),
        centerTitle: true,
        toolbarHeight: 72,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            iconSize: 25,
            icon: Image.asset(
              "assets/icons/Menu.png",
            ),
            onPressed: () {},
          ),
        ),
        backgroundColor: Color.fromRGBO(9, 151, 153, 1),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
            iconSize: 25,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              itemCards(
                  labelText: "Recommended Items",
                  headSize: sizeVertical * 0.025,
                  subSize: sizeVertical * 0.02,
                  path: null
                  ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 20,
                thickness: 0.25,
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shop By Category",
                    style: heading1,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return categoryCard(index: index);
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Divider(
                height: 20,
                thickness: 0.25,
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              itemCards(
                labelText: "Products by other Sellers",
                headSize: sizeVertical * 0.023,
                subSize: sizeVertical * 0.02,
                path: null,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 20,
                thickness: 0.25,
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Vendor",
                    style: TextStyle(
                        color: Color(0xff0B5F5A),
                        fontSize: sizeVertical * 0.03),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: floatingButtonAccent1,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1),
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text("  View All Vendors "),
                          Icon(Icons.arrow_forward_sharp),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const shopByVendor(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: vendorList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        vendorCard(
                          name: vendorList[index]['name'].toString(),
                          vendorName:
                              vendorList[index]['vendorName'].toString(),
                          phoneNo: vendorList[index]['phoneNo'].toString(),
                          lastPurchaseDate:
                              vendorList[index]['lastPurchase'].toString(),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
