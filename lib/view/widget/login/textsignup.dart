import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class Textsignupandtlogin extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;
  const Textsignupandtlogin(
      {Key? key, required this.text1, required this.text2, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.headline3,
        ),
        InkWell(
            onTap: onTap,
            child: Text(text2,
                style: const TextStyle(
                    color: Appcolor.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)))
      ],
    );
  }
}
