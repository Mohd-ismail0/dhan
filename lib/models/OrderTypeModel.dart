class OrderType {
  TypeOfOrder type;
  bool? isSelected ;
  OrderType({required this.type, required isSelected});
}

enum TypeOfOrder { PendingOrder, CompletedOrder, ReadyToPickup }

extension TypeOfOrderExt on TypeOfOrder {
  static const map = {
    TypeOfOrder.CompletedOrder: "Completed Order",
    TypeOfOrder.ReadyToPickup: "Ready to Pickup",
    TypeOfOrder.PendingOrder: "Pending Order",
  };
}
