import 'package:dhanda_app/features/billing/controller/billing_controller.dart';
import 'package:dhanda_app/models/products_model.dart';
import 'package:dhanda_app/theme/app_theme.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class ProductsListView extends ConsumerWidget {
  final double rowHeight = 70;
  final Color rowColor = AppTheme.kYellow;
  final double rowSpace = 10;
  List<ProductsModel> productList = [];

  _increaseQuanity(WidgetRef ref, index) {
    ref.read(billingControllerProvider.notifier).increaseQuantity(index);
  }

  _decreaseQuantity(WidgetRef ref, index) {
    ref.read(billingControllerProvider.notifier).decreaseQuantity(index);
  }

  _removeProduct(WidgetRef ref, index) {
    ref.read(billingControllerProvider.notifier).removeProduct(index);
  }

  // List<TableRow> tableItems() {
  _listItemWidget(WidgetRef ref, int index, context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
          child: Material(
            borderRadius: BorderRadius.circular(5),
            elevation: 3,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${productList[index].brandName}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("HSN Code ${productList[index].hsnCode.truncate()}"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      // ignore: unnecessary_null_comparison
                      if (productList[index].weight != null)
                        Text(
                          "${productList[index].weight}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      // ignore: unnecessary_null_comparison
                      if (productList[index].weight != null)
                        SizedBox(
                          width: 15,
                        ),
                      Row(
                        children: [
                          Text("MRP: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppTheme.kBlack),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text("₹${productList[index].mrp}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Net Total: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              "₹${productList[index].productQuantity * productList[index].mrp}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => _decreaseQuantity(ref, index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.kRed,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.remove_outlined,
                                color: AppTheme.kWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${productList[index].productQuantity}",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => _increaseQuanity(ref, index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.kLightGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppTheme.kWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "GST: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "₹${(productList[index].productQuantity * productList[index].mrp * (productList[index].tax / 100)).toStringAsPrecision(3)}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text("(${productList[index].tax}%)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Total: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "₹${(productList[index].productQuantity * productList[index].mrp + productList[index].productQuantity * productList[index].mrp * (productList[index].tax / 100))}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(0),
                  color: AppTheme.kRed,
                  child: Icon(
                    Icons.clear,
                    color: AppTheme.kWhite,
                  ),
                  onPressed: () => _removeProduct(ref, index)),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    productList = ref.watch(billingControllerProvider).productsModelList;
    print("REBUILDING LISTVIEW");
    return ListView.separated(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: productList.length,
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemBuilder: (context, index) {
          return _listItemWidget(ref, index, context);
        });
  }
}
