import 'package:flutter/cupertino.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../data/datasource/remote/forgetpassworddata/checkemail.dart';

abstract class Forgetpasswordcontroller extends GetxController {
  checkemail();
}

class ForgetpasswordcontrollerImp extends Forgetpasswordcontroller {
  Checkemaildata checkemaildata = Checkemaildata(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.bos;

  late TextEditingController email;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemaildata.postdata(
        email.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handilingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(Approute.verifycode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "54".tr,
              titleStyle: const TextStyle(fontSize: 15),
              content: getContent());
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  Widget getContent() {
    return Lottie.asset(AppImageasset.ntcorrent,
        width: 60, height: 60, repeat: false);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
