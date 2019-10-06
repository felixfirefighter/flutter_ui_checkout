import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_ui_checkout/data/data.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.restaurant,
                      color: Colors.green[700],
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    Text(
                      cartData.restaurant,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 20.0,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Your Order',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Add item',
                        style: TextStyle(
                          color: Colors.green[700],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: cartData.orders.map((order) {
                    return ListTile(
                      leading: AspectRatio(
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                              order.imageUrl,
                            )),
                        aspectRatio: 1,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            order.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "\$${order.total.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: order.orderAddOns.map(
                              (addOn) {
                                return Text(
                                  '${addOn.name} (\$${addOn.price.toStringAsFixed(2)})',
                                  style: TextStyle(fontSize: 11),
                                );
                              },
                            ).toList(),
                          ),
                          Row(
                            children: <Widget>[
                              ButtonTheme(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                height: 24,
                                minWidth: 24,
                                child: OutlineButton(
                                  borderSide: BorderSide(
                                    color: Colors.black38,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 12,
                                  ),
                                  onPressed: order.quantity <= 1
                                      ? null
                                      : () {
                                          setState(() {
                                            order.quantity--;
                                          });
                                        },
                                  padding: EdgeInsets.all(4),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${order.quantity}",
                                  style: TextStyle(color: Colors.green[700]),
                                ),
                              ),
                              ButtonTheme(
                                height: 24,
                                minWidth: 24,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                child: OutlineButton(
                                  borderSide: BorderSide(
                                    color: Colors.black38,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 12,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      order.quantity++;
                                    });
                                  },
                                  padding: EdgeInsets.all(4),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      isThreeLine: true,
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 20.0,
                  bottom: 8,
                ),
                child: Text(
                  'Maybe you would like these?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: cartData.recommendedOrders.map((order) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    order.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    "\$${order.price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Image.network(order.imageUrl)
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24,
          ),
          child: FlatButton(
            padding: EdgeInsets.all(14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: Colors.green[700],
            child: Text(
              'Checkout'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
