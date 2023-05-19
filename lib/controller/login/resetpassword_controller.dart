import 'package:flutter/cupertino.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../data/datasource/remote/forgetpassworddata/resetpassword.dart';

abstract class Resetpasswordcontroller extends GetxController {
  resetpassword();
  goTookresetpassword();
}

class ResetpasswordcontrollerImp extends Resetpasswordcontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Resetpassworddata resetpassworddata = Resetpassworddata(Get.find());
  StatusRequest statusRequest = StatusRequest.bos;

  late TextEditingController password;
  late TextEditingController repassword;

  String? email;

  bool showpassword = true;

  funcshowpassword() {
    showpassword = showpassword == true ? false : true;
    update();
  }

  @override
  resetpassword() {}

  @override
  goTookresetpassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "55".tr,
          titleStyle: const TextStyle(fontSize: 15),
          content: getContent());
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetpassworddata.postdata(
        email!,
        password.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handilingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(Approute.okresetpassword);
        } else {
          Get.defaultDialog(
              title: "56".tr,
              titleStyle: const TextStyle(fontSize: 15),
              content: getContent());
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  Widget getContent() {
    return Lottie.asset(AppImageasset.ntcorrent,
        width: 60, height: 60, repeat: false);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
