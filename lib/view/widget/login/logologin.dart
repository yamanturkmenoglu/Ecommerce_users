import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';

class Logologin extends StatelessWidget {
  const Logologin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageasset.logo,
      height: 180,
    );
  }
}
