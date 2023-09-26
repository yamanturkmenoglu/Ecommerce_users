import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';

class CartDeliveryTapeCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  final String imagename;
  const CartDeliveryTapeCheckout(
      {Key? key,
      required this.title,
      required this.isActive,
      required this.imagename})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: isActive ? Appcolor.orange : null,
          border: Border.all(color: Appcolor.orange),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            width: 70,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Appcolor.white : Appcolor.orange,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
