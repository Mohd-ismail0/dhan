import 'package:dhanda_app/features/dhandaBaazar/categories/productInfo.dart';
import 'package:dhanda_app/features/dhandaBaazar/dhandaBaazarWidgets.dart';
import 'package:flutter/material.dart';

class categoryWidget extends StatelessWidget {
  final int index;
  const categoryWidget({required this.index});
  @override
  Widget build(BuildContext context) {
    var sizeVertical = MediaQuery.of(context).size.height;
    var sizeHorizontal = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: 1),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding:
                          EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: Image(
                        image: AssetImage(
                          productInfo[index]['picture'].toString(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: addToCart(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Product ${index + 1}",
                  style: TextStyle(
                      fontSize: sizeVertical * 0.025,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Qty: " + productInfo[index]['qty'].toString(),
                  style: TextStyle(fontSize: sizeVertical * 0.015),
                ),
                Text(
                  "Price: " + productInfo[index]['price'].toString(),
                  style: TextStyle(fontSize: sizeVertical * 0.015),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
