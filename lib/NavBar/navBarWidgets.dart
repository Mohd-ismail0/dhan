import 'package:flutter/material.dart';

class SideBarBox extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;

  const SideBarBox({
    required this.width,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.titleStyle,
    required this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: titleStyle,),
          Text(subtitle, style: subtitleStyle,),
        ],
      ),
    );
  }
}

class NavBarTiles extends StatelessWidget {
  final Icon leadIcon;
  final String title;
  final TextStyle titleStyle;
  const NavBarTiles({required this.leadIcon, required this.title, required this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: leadIcon,
        title: Text(title, style: titleStyle,),
      ),
    );
  }
}
