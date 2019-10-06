import 'package:flutter_ui_checkout/models/order_add_on.dart';

class Order {
  String id;
  String imageUrl;
  String name;
  List<OrderAddOn> orderAddOns;
  double price;
  int quantity;

  Order({
    this.id,
    this.imageUrl,
    this.name,
    this.orderAddOns = const [],
    this.price,
    this.quantity,
  });

  double get total {
    double addOnSum = orderAddOns.fold(0.0, (double sum, OrderAddOn addOn) {
      return sum + addOn.price;
    });
    return (addOnSum + price) * quantity;
  }
}
