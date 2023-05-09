import 'package:dhanda_app/models/OrderTypeModel.dart';

List<OrderType> typesOfOrder = [
  OrderType(type: TypeOfOrder.PendingOrder, isSelected: true),
  OrderType(type: TypeOfOrder.ReadyToPickup, isSelected: false),
  OrderType(type: TypeOfOrder.CompletedOrder, isSelected: false),
];
