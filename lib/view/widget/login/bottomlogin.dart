import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class Bottumlogin extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const Bottumlogin({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 3),
        textColor: Colors.white,
        onPressed: onPressed,
        color: Appcolor.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        splashColor: Colors.white,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
