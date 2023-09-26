import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class PriceAndCount extends StatelessWidget {
  final void Function()? onadd;
  final void Function()? onremov;
  final String count;
  final String price;
  const PriceAndCount(
      {Key? key,
      required this.onadd,
      required this.onremov,
      required this.count,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: onadd,
                icon: const Icon(
                  Icons.add,
                  color: Appcolor.orange,
                )),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Appcolor.black,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                count,
              ),
            ),
            IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: onremov,
                icon: const Icon(
                  Icons.remove,
                  color: Appcolor.orange,
                )),
          ],
        ),
        const Spacer(),
        Text(
          "$price TL",
          // ignore: prefer_const_constructors
          style: TextStyle(
              fontSize: 20,
              color: Appcolor.orange,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
