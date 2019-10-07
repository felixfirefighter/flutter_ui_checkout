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
                      fontSize: 13,
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
                      fontSize: 13,
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
                      fontSize: 13,
                    ),
                  ),
                  onTap: () {},
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
