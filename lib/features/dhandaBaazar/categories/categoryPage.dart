import 'package:dhanda_app/features/dhandaBaazar/categories/categoryWidget.dart';
import 'package:flutter/material.dart';

class categoryPage extends StatelessWidget {
  final int index;
  const categoryPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category ${index + 1}",
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
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SizedBox(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return categoryWidget(
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
