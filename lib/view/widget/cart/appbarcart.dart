import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class AppBarCart extends StatelessWidget {
  final String title;
  final onpressed;
  const AppBarCart({Key? key, required this.title, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Appcolor.white,
      child: Row(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onpressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Appcolor.orange,
              ),
            ),
          )),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12),
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24, // Yazı tipini büyüttük
                  color: Appcolor.orange,
                  fontWeight: FontWeight.bold,
                  // Harfler arasındaki boşluğu artırdık
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
