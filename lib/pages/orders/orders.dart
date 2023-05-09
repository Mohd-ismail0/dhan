import 'package:dhanda_app/models/OrderTypeModel.dart';
import 'package:dhanda_app/pages/orders/orderList.dart';
import 'package:dhanda_app/pages/orders/orderTypeList.dart';
import 'package:flutter/material.dart';
import '../../core/constants/image_constants.dart';
import '../../theme/app_theme.dart';

// ignore: must_be_immutable
class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int currIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    typesOfOrder[0].isSelected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 72,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Orders",
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 0.5, fontSize: 25),
        ),
        backgroundColor: AppTheme.kLightGreen,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            iconSize: 25.0,
            icon: Image.asset(ImageConstants.menu),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: typesOfOrder.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        typesOfOrder[currIndex].isSelected = false;
                        typesOfOrder[index].isSelected = true;
                        currIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: typesOfOrder[index].isSelected ?? false
                              ? AppTheme.kDarkGreen
                              : AppTheme.kLightGreen,
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Center(
                        child: Container(
                          child: Text(
                            TypeOfOrderExt.map[typesOfOrder[index].type]!,
                            style: TextStyle(color: AppTheme.kWhite),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listOfOrders.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: listOfOrders[index].orderImage,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Order " + listOfOrders[index].orderId!),
                            Text("-"),
                            Text(listOfOrders[index].customer.name)
                          ]),
                      subtitle: Text("Saffola Oil 10L + 18 items"),
                      trailing:
                          Image(image: AssetImage('assets/images/arrow.png')),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
