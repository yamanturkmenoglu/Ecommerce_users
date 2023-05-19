import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

// ignore: camel_case_types
class Bottononboarding extends GetView<Onboardingcontrollerimp> {
  const Bottononboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: Appcolor.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        splashColor: Colors.white,
        child: Text(
          "8".tr,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
