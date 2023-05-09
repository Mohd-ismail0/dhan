import 'package:dhanda_app/core/constants/image_constants.dart';
import 'package:dhanda_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SearchSectionWidget extends StatelessWidget {
  const SearchSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: AppTheme.kBlack)),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(hintText: "Search"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  ImageConstants.search,
                  color: AppTheme.kBlack,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppTheme.kLightGreen,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              Icons.mic,
              color: AppTheme.kWhite,
            ))
      ],
    );
  }
}
