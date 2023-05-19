import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class Titleonehome extends StatelessWidget {
  final String title;
  const Titleonehome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Appcolor.orange,
        ));
  }
}
