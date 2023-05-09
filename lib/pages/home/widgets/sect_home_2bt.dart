//section with 2 button for home page

import 'package:flutter/material.dart';

class Secthome extends StatelessWidget {
  final String headingtext;
  final String headingassetimage;
  final String bt1text;
  final String bt1asset;
  final String bt2text;
  final String bt2asset;
  final String onpressed1;
  final String onpressed2;

  const Secthome(
      {required this.headingtext,
      required this.headingassetimage,
      required this.bt1text,
      required this.bt1asset,
      required this.bt2text,
      required this.bt2asset,
      required this.onpressed1,
      required this.onpressed2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
                child: Text(headingtext,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                        color: Color.fromRGBO(11, 95, 90, 1.0))),
              ),
              IconButton(
                  onPressed: () {},
                  iconSize: 30,
                  icon: Image.asset("$headingassetimage"))
            ],
          ),
          //inventory name

          SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RawMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '$onpressed1');
                },
                fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                elevation: 4,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Container(
                  width: 122,
                  height: 122,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
                        child: ImageIcon(
                          AssetImage(bt1asset),
                          color: Color.fromRGBO(39, 113, 108, 1.0),
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        bt1text,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                            fontSize: 14,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      )
                    ],
                  ),
                ),
              ), //1st button

              SizedBox(
                width: 50,
              ),

              RawMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '$onpressed2');
                },
                fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                elevation: 4,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Container(
                  width: 122,
                  height: 122,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
                        child: ImageIcon(
                          AssetImage(bt2asset),
                          color: Color.fromRGBO(39, 113, 108, 1.0),
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        bt2text,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.75,
                            fontSize: 14,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      )
                    ],
                  ),
                ),
              ) //2nd button
            ],
          ),
        ],
      ),
    );
  }
}
