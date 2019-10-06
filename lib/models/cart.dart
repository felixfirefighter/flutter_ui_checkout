import 'package:flutter_ui_checkout/models/order.dart';
import 'package:flutter_ui_checkout/models/order_add_on.dart';
import 'package:flutter_ui_checkout/models/payment_method.dart';
import 'package:flutter_ui_checkout/models/recommended_order.dart';

class Cart {
  String restaurant;
  String address;
  DateTime deliveryTime;
  PaymentMethod paymentMethod;
  List<Order> orders;
  List<RecommendedOrder> recommendedOrders;
  double deliveryFee;

  Cart({
    this.restaurant,
    this.address,
    this.deliveryTime,
    this.paymentMethod,
    this.orders,
    this.recommendedOrders = const [],
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
