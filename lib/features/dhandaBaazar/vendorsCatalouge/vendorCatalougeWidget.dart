import 'package:flutter/material.dart';

class vendorCatalougeWidget extends StatelessWidget {
  final int productNo;
  const vendorCatalougeWidget({required this.productNo, });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 5)
            ),
            child:
                Image(image: AssetImage("assets/samplePictures/samplePhoto.png")),
          ),
        ),
      ],
    );
  }
}
