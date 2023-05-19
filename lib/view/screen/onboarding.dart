// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../widget/onboarding/botton_onboarding.dart';
import '../widget/onboarding/dot_onboarding.dart';
import '../widget/onboarding/onboarding_custom.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Onboardingcontrollerimp());
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Expanded(
          flex: 3,
          child: Onboardingcustom(),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: const [
                Dotonboarding(),
                Spacer(
                  flex: 2,
                ),
                Bottononboarding(),
              ],
            ))
      ],
    )));
  }
}
