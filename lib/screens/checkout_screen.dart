import 'package:flutter/material.dart';
import 'package:flutter_ui_checkout/components/app_bar_title.dart';
import 'package:flutter_ui_checkout/components/base_bottom_app_bar.dart';
import 'package:flutter_ui_checkout/components/base_list_tile.dart';
import 'package:flutter_ui_checkout/data/data.dart';
import 'package:flutter_ui_checkout/models/payment_method.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          text: 'Checkout',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Column(
            children: <Widget>[
              BaseListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.green[700],
                ),
                title: 'Deliver to',
                subtitle: cartData.address,
                trailing: GestureDetector(
                  child: Text(
                    'Change',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              BaseListTile(
                leading: Icon(
                  Icons.access_time,
                  color: Colors.green[700],
                ),
                title: 'Delivery Time',
                subtitle:
                    "${cartData.deliveryTime.difference(DateTime.now()).inMinutes.toString()} min",
                trailing: GestureDetector(
                  child: Text(
                    'Change',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              BaseListTile(
                leading: Icon(
                  Icons.credit_card,
                  color: Colors.green[700],
                ),
                title: 'Payment',
                subtitle: "${displayPaymentMethod(cartData.paymentMethod)}",
                trailing: GestureDetector(
                  child: Text(
                    'Change',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Your Order',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Add item',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontSize: 12,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    ...cartData.orders.map((order) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Image.network(
                                  order.imageUrl,
                                  height: 50,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.green[50],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    "${order.quantity}",
                                    style: TextStyle(
                                      color: Colors.green[700],
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    order.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  ...order.orderAddOns.map((addOn) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1.0),
                                      child: Text(
                                        "${addOn.name} (\$${addOn.price.toStringAsFixed(2)})",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "\$${order.total.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Divider(
                        height: 1,
                        color: Colors.black26,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Subtotal',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "\$${cartData.total.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 6.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Delivery Fee',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "\$${cartData.deliveryFee.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Divider(
                        height: 1,
                        color: Colors.black26,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 10.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${cartData.totalWithDeliveryFee.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomAppBar(
        text: 'Pay Now',
        onPressed: () {},
      ),
    );
  }
}
