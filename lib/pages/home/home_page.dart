import 'package:dhanda_app/core/constants/image_constants.dart';
import 'package:dhanda_app/pages/home/widgets/section_divider.dart';
import 'package:dhanda_app/pages/home/widgets/sect_home_2bt.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 72,
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 25),
        ),
        backgroundColor: Color.fromRGBO(9, 151, 153, 1),
        leading: IconButton(
          iconSize: 30.0,
          icon: Image.asset(ImageConstants.avatar),
          onPressed: () {},
        ),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                onPressed: () {},
                iconSize: 25.0,
                icon: Image.asset(ImageConstants.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/new-billing');
                },
                iconSize: 45.0,
                icon: Image.asset(ImageConstants.barcodeScan),
              ),
            ],
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5),
                child: Text('Store Name',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                        color: Color.fromRGBO(11, 95, 90, 1.0))),
              ),
              Divider(
                height: 20,
                thickness: 1,
                indent: 15,
                endIndent: 15,
                color: Color.fromRGBO(11, 95, 90, 1.0),
              ),

              SizedBox(
                height: 15,
              ),

              Secthome(
                headingtext: "Sales",
                headingassetimage: ImageConstants.salesIcon,
                bt1text: "Billing",
                bt1asset: ImageConstants.billingIcon,
                bt2text: "Online Orders",
                bt2asset: ImageConstants.ordersIcon,
                onpressed1: "/new-billing",
                onpressed2: "/online-orders",
              ), //sales

              SizedBox(
                height: 15,
              ),

              sectionDivider(),

              Secthome(
                  headingtext: "Inventory",
                  headingassetimage: ImageConstants.inventoryIcon,
                  bt1text: "Manage",
                  bt1asset: ImageConstants.manageIcon,
                  bt2text: "Restock",
                  bt2asset: ImageConstants.restockIcon,
                  onpressed1: "",
                  onpressed2: "/dhandaBaazar"), //inventory

              SizedBox(
                height: 15,
              ),

              sectionDivider(),

              Secthome(
                  headingtext: "Purchases",
                  headingassetimage: ImageConstants.purchaseIcon,
                  bt1text: "Purchase Entry",
                  bt1asset: ImageConstants.purchaseEntryIcon,
                  bt2text: "Purchase History",
                  bt2asset: ImageConstants.purchaseHistoryIcon,
                  onpressed1: "",
                  onpressed2: ""), //purchases

              SizedBox(
                height: 15,
              ),
              sectionDivider(),

              Secthome(
                  headingtext: "Payments",
                  headingassetimage: ImageConstants.paymentsIcon,
                  bt1text: "Balance & \n History",
                  bt1asset: ImageConstants.balanceHistoryIcon,
                  bt2text: "Credit Ledger",
                  bt2asset: ImageConstants.creditLedgerIcon,
                  onpressed1: "",
                  onpressed2: ""),

              SizedBox(
                height: 15,
              ),

              sectionDivider(),
              Secthome(
                  headingtext: "Accounting",
                  headingassetimage: ImageConstants.accountsIcon,
                  bt1text: "GST",
                  bt1asset: ImageConstants.gstIcon,
                  bt2text: "Records",
                  bt2asset: ImageConstants.recordsIcon,
                  onpressed1: "",
                  onpressed2: ""), //Accounting

              SizedBox(
                height: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
