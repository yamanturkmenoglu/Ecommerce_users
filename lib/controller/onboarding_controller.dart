import 'package:flutter/cupertino.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class Onboardingcontroller extends GetxController {
  next();
  onpagechanged(int i);
}

class Onboardingcontrollerimp extends Onboardingcontroller {
  late PageController pageController;
  int currentpage = 0;
  MyServices myServices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > onboardinList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(Approute.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }

  @override
  onpagechanged(int i) {
    currentpage = i;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
