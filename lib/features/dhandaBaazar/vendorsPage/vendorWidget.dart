import 'package:dhanda_app/features/dhandaBaazar/dhandaBaazarConsts.dart';
import 'package:dhanda_app/features/dhandaBaazar/vendorsCatalouge/vedorsCatalouge.dart';
import 'package:dhanda_app/features/dhandaBaazar/vendorsPage/vendorInfo.dart';

import 'package:flutter/material.dart';

class vendorWidget extends StatelessWidget {
  final String vendorOrgName;
  final String vendorName;
  final String vendorPhone;
  final String cateogry;
  final String lastPurchase;
  final int index;

  const vendorWidget({
    required this.vendorName,
    required this.vendorOrgName,
    required this.vendorPhone,
    required this.cateogry,
    required this.lastPurchase,
    required this.index
  });
  @override
  Widget build(BuildContext context) {
    var sizeVertical = MediaQuery.of(context).size.height;
    var sizeHorizontal = MediaQuery.of(context).size.width;
    return Container(
      decoration: shadow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage("assets/samplePictures/samplePhoto2.jpg"),
            radius: sizeHorizontal * 0.075,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizeVertical * 0.008),
              Text(
                vendorOrgName,
                style: TextStyle(
                    fontSize: sizeVertical * 0.02,
                    color: Color(0xff0B5F5A),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: sizeVertical * 0.01),
              Row(
                children: [
                  Text(
                    vendorName,
                    style: TextStyle(
                        fontSize: sizeVertical * 0.0175, color: Colors.red),
                  ),
                  SizedBox(
                    width: sizeHorizontal * 0.05,
                  ),
                  Text("Ph: $vendorPhone")
                ],
              ),
              SizedBox(height: sizeVertical * 0.01),
              Text(
                "Categories : $cateogry",
                style: TextStyle(
                    fontSize: sizeVertical * 0.0175, color: Color(0xff0B5F5A)),
              ),
              SizedBox(height: sizeVertical * 0.01),
              Text(
                "Last Purchase : $lastPurchase",
                style: TextStyle(fontSize: sizeVertical * 0.015),
              ),
              SizedBox(height: sizeVertical * 0.008),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context, ) => veondorsCatalouge(
                    name: vendorOrgName,
                    address: vendorInfo[index]['address'].toString(),
                    gstin: vendorInfo[index]['gstin'].toString(),
                    phone: vendorInfo[index]['phoneNo'].toString(),
                    productNo: index,
                  ),
                ),
              );
            },
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
