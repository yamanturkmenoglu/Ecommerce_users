import 'package:flutter/cupertino.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/data/datasource/remote/logindata/verfiycodesignup.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

abstract class Verifycodesignupcontroller extends GetxController {
  checkecode();
  goTooksignup(String verifycodsignup);
}

class VerifycodesignupcontrollerImp extends Verifycodesignupcontroller {
  Verifycodesignupdata verifycodesignupdata = Verifycodesignupdata(Get.find());

  String? email;

  StatusRequest statusRequest = StatusRequest.bos;

  @override
  checkecode() {}

  @override
  goTooksignup(verifycodsignup) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodesignupdata.postdata(email!, verifycodsignup);
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(Approute.oksignup);
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
