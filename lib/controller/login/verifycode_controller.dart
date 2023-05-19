import 'package:flutter/cupertino.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/view/screen/auth/verifycode.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/class/statusrequest.dart';
import '../../data/datasource/remote/forgetpassworddata/verifycodeforgetpasswoed.dart';

abstract class Verifycodecontroller extends GetxController {
  checkecode();
  goToresetpassword(String verifycode);
}

class VerifycodecontrollerImp extends Verifycodecontroller {
  String? email;

  Verifycodeforgetpassworddata verifycodeforgetpassworddata =
      Verifycodeforgetpassworddata(Get.find());
  StatusRequest statusRequest = StatusRequest.bos;

  @override
  checkecode() {}

  @override
  goToresetpassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifycodeforgetpassworddata.postdata(email!, verifycode);
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(Approute.resetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "52".tr,
            titleStyle: const TextStyle(fontSize: 15),
            content: getContent());
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Widget getContent() {
    return Lottie.asset(AppImageasset.ntcorrent,
        width: 60, height: 60, repeat: false);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
