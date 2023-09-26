import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class CartPymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CartPymentMethodCheckout(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isActive == true ? Appcolor.orange : Appcolor.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromARGB(255, 202, 202, 202)),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: isActive == true ? Appcolor.white : Appcolor.orange,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
