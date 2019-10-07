import 'package:flutter_ui_checkout/models/cart.dart';
import 'package:flutter_ui_checkout/models/order.dart';
import 'package:flutter_ui_checkout/models/order_add_on.dart';
import 'package:flutter_ui_checkout/models/payment_method.dart';
import 'package:flutter_ui_checkout/models/recommended_order.dart';

final Cart cartData = new Cart(
    restaurant: 'Healthy Foodie',
    address: '411 Elm St, Dallas, Texas 75202',
    deliveryTime: DateTime.now().add(Duration(hours: 1)),
    deliveryFee: 3,
    paymentMethod: PaymentMethod.applePay,
    orders: [
      Order(
        id: 'o_1',
        imageUrl:
            'https://i.dlpng.com/static/png/1795299-how-can-we-help-you-today-healthy-food-png-792_797_preview.png',
        name: 'Salmon',
        price: 24,
        quantity: 1,
        orderAddOns: [
          OrderAddOn(
            name: 'Extra salad',
            price: 1,
          )
        ],
      ),
      Order(
        id: 'o_2',
        imageUrl:
            'https://www.sccpre.cat/mypng/full/66-668826_free-range-grilled-chicken-caloriesmart.png',
        name: 'Grilled Chicken',
        orderAddOns: [
          OrderAddOn(
            name: 'Extra meat',
            price: 2,
          ),
          OrderAddOn(
            name: 'Extra egg',
            price: 1,
          )
        ],
        price: 11,
        quantity: 2,
      ),
    ],
    recommendedOrders: [
      RecommendedOrder(
        imageUrl:
            'http://www.pngall.com/wp-content/uploads/2016/04/Juice-Download-PNG.png',
        name: 'Orange Juice',
        price: 3,
      ),
      RecommendedOrder(
        imageUrl:
            'http://www.pngall.com/wp-content/uploads/2016/04/Juice-PNG-Picture.png',
        name: 'Grapefruit Juice',
        price: 3,
      ),
      RecommendedOrder(
        imageUrl:
            'http://www.pngall.com/wp-content/uploads/2016/04/Juice-PNG-Pic.png',
        name: 'Mixed Fruit Juice',
        price: 4,
      ),
    ]);
