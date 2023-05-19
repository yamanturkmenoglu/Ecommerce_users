import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class Dotonboarding extends StatelessWidget {
  const Dotonboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onboardingcontrollerimp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboardinList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentpage == index ? 25 : 10,
                          height: 9,
                          decoration: BoxDecoration(
                              color: Appcolor.orange,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
