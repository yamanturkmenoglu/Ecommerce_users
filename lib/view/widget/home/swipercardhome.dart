import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

class Swipercardhome extends StatelessWidget {
  final String titel;
  final String subtitle;

  const Swipercardhome({Key? key, required this.titel, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            // ignore: sort_child_properties_last
            child: ListTile(
              title: Text(
                titel,
                style: const TextStyle(color: Appcolor.sari, fontSize: 15),
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(color: Appcolor.sari, fontSize: 19),
              ),
            ),
            height: 120,
            decoration: BoxDecoration(
                color: Appcolor.orange,
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
            top: -14,
            right: -10,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Appcolor.sari,
                  borderRadius: BorderRadius.circular(160)),
            ),
          )
        ]));
  }
}
