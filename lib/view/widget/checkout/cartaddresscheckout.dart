import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class CartAddressCheckout extends StatelessWidget {
  final String title;
  final String bady;
  final bool isActive;
  const CartAddressCheckout(
      {Key? key,
      required this.title,
      required this.bady,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? Appcolor.orange : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? Appcolor.white : null),
        ),
        subtitle: Text(
          bady,
          style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : null,
              color: isActive ? Appcolor.white : null),
        ),
      ),
    );
  }
}
