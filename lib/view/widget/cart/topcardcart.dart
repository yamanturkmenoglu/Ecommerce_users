import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class TopCardCart extends StatelessWidget {
  final String massege;
  const TopCardCart({Key? key, required this.massege}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 135, 118),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        massege,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Appcolor.white),
      ),
    );
  }
}
