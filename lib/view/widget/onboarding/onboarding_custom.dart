import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/onboarding_controller.dart';
import 'package:get/get.dart';
import '../../../data/datasource/static/static.dart';

class Onboardingcustom extends GetView<Onboardingcontrollerimp> {
  const Onboardingcustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (i) {
          controller.onpagechanged(i);
        },
        itemCount: onboardinList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(child: Image.asset(onboardinList[i].image!)),
                const SizedBox(height: 20),
                Text(onboardinList[i].titel!,
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onboardinList[i].body!,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ));
  }
}
