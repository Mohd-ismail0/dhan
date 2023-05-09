import 'package:dhanda_app/features/dhandaBaazar/categories/categoryPage.dart';
import 'package:flutter/material.dart';

import 'package:dhanda_app/features/dhandaBaazar/dhandaBaazarConsts.dart';

class floatingButton extends StatelessWidget {
  final String buttonText;
  final double buttonHeight;
  final double buttonWidth;
  final double textHeight;
  final double iconSize;
  Widget? goTo;

  floatingButton({
    required this.buttonText,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.textHeight,
    required this.iconSize,
    this.goTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: buttonHeight * 0.03,
        width: buttonWidth * 0.25,
        decoration: BoxDecoration(
            color: floatingButtonAccent1,
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 1),
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.035,
            ),
            Text(
              buttonText,
              style: TextStyle(fontSize: buttonWidth * 0.04),
            ),
            Icon(
              Icons.arrow_forward_sharp,
              size: iconSize * 0.04,
            ),
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
            builder: (context) => goTo!,
          ),
        );
      },
    );
  }
}

class itemCards extends StatelessWidget {
  final String labelText;
  final double headSize;
  final double subSize;
  Widget? path;
  itemCards(
      {required this.labelText,
      required this.headSize,
      required this.subSize,
      this.path});

  @override
  Widget build(BuildContext context) {
    var sizeVertical = MediaQuery.of(context).size.height;
    var sizeHorizontal = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5, color: Colors.grey)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    labelText,
                    style:
                        TextStyle(fontSize: headSize, color: Color(0xff0B5F5A)),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Based on Current Inventory",
                    style: TextStyle(fontSize: subSize),
                  )
                ],
              ),
              floatingButton(
                buttonHeight: sizeVertical,
                textHeight: sizeVertical,
                iconSize: sizeHorizontal,
                buttonText: "View All",
                buttonWidth: sizeHorizontal,
                goTo: path,
              )
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: sizeVertical * 0.22,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return productsCard(index: index, price: 100, quantity: 5);
                }),
          )
        ],
      ),
    );
  }
}

class productsCard extends StatelessWidget {
  final int price;
  final int index;
  final int quantity;
  const productsCard({
    required this.index,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: screenSize.height * 0.2,
          width: screenSize.width * 0.4,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
            )
          ], color: Colors.white),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: screenSize.height * 0.12,
                    width: screenSize.width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/samplePictures/samplePhoto.png",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.12,
                    width: screenSize.width * 0.27,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            addToCart()
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text("Product ${index + 1}", style: TextStyle(fontSize: screenSize.height * 0.02),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Qty: $quantity g", style: TextStyle(fontSize: screenSize.height * 0.02),),
                  SizedBox(width: 10),
                  Text("Price: ₹$price", style: TextStyle(fontSize: screenSize.height * 0.02),),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}

class categoryCard extends StatelessWidget {
  final int index;
  const categoryCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => categoryPage(
              index: index,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          children: [
            Image(
              height: 100,
              image: AssetImage("assets/samplePictures/samplePhoto.png"),
            ),
            Text("Category ${index + 1}")
          ],
        ),
      ),
    );
  }
}

class vendorCard extends StatelessWidget {
  final String phoneNo;
  final String name;
  final String vendorName;
  final String lastPurchaseDate;

  const vendorCard({
    required this.name,
    required this.vendorName,
    required this.phoneNo,
    required this.lastPurchaseDate,
  });

  @override
  Widget build(BuildContext context) {
    var sizeVertical = MediaQuery.of(context).size.height;
    var sizeHorizontal = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
          )
        ],
        color: Colors.white,
      ),
      child: Container(
        width: sizeHorizontal * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: sizeHorizontal * 0.08,
              backgroundImage: AssetImage(
                "assets/samplePictures/samplePhoto.png",
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: sizeVertical * 0.02,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      vendorName,
                      style: TextStyle(fontSize: sizeVertical * 0.015),
                    ),
                    Text(
                      "    Ph: $phoneNo",
                      style: TextStyle(fontSize: sizeVertical * 0.015),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Last Purchase : $lastPurchaseDate",
                  style: TextStyle(fontSize: sizeVertical * 0.017),
                )
              ],
            ),
            SizedBox(
              width: sizeHorizontal * 0.0085,
            ),
            IconButton(
              icon: Icon(
                Icons.navigate_next,
                size: 35,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class addToCart extends StatelessWidget {
  const addToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFB641B), borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [Text("## "), Icon(Icons.add_shopping_cart)],
      ),
    );
  }
}
