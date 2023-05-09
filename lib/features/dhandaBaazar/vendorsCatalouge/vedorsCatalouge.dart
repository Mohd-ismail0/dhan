import 'package:dhanda_app/features/dhandaBaazar/vendorsCatalouge/vendorCatalougeWidget.dart';
import 'package:flutter/material.dart';


class veondorsCatalouge extends StatelessWidget {
  final String name;
  final String address;
  final String gstin;
  final String phone;
  final int productNo;

  const veondorsCatalouge(
      {required this.name,
      required this.address,
      required this.gstin,
      required this.phone,
      required this.productNo});

  @override
  Widget build(BuildContext context) {
    var sizeVertical = MediaQuery.of(context).size.height;
    var sizeHorizontal = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Vendor's Catalouge",
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
              icon: Icon(Icons.shopping_cart_outlined),
              iconSize: 25,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, color: Color(0xff0B5F5A)),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Address : $address"),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("GSTIN:     $gstin"), Text("Phone:   $phone")],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 20,
                thickness: 1,
                indent: 15,
                endIndent: 15,
                color: Color(0xff0B5F5A),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return vendorCatalougeWidget(
                        productNo: productNo,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
