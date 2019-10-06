import 'package:flutter_ui_checkout/models/order.dart';
import 'package:flutter_ui_checkout/models/order_add_on.dart';
import 'package:flutter_ui_checkout/models/payment_method.dart';

class Cart {
  String restaurant;
  String address;
  DateTime deliveryTime;
  PaymentMethod paymentMethod;
  List<Order> orders;
  double deliveryFee;

  Cart({
    this.restaurant,
    this.address,
    this.deliveryTime,
    this.paymentMethod,
    this.orders,
    this.deliveryFee,
  });

  double get total {
    return orders.fold(0.0, (double allOrderSum, Order order) {
      double addOnSum = 0;
      addOnSum = order.orderAddOns.fold(0.0, (double sum, OrderAddOn addOn) {
        sum += addOn.price;
        return sum;
      });

      return allOrderSum + (order.price + addOnSum) * order.quantity;
    });
  }
}
