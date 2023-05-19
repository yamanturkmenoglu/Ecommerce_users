import 'package:flutter/cupertino.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/data/datasource/remote/logindata/signup.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/imageasset.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.bos;

  Signupdata signupdata = Signupdata(Get.find());

  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupdata.postdata(
          username.text, password.text, email.text, phone.text);
      statusRequest = handilingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(Approute.verifycodesignup,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "51".tr,
              titleStyle: const TextStyle(fontSize: 15),
              content: getContent());
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  Widget getContent() {
    return Lottie.asset(AppImageasset.ntcorrent,
        width: 60, height: 60, repeat: false);
  }

  bool showpassword = true;

  funcshowpassword() {
    showpassword = showpassword == true ? false : true;
    update();
  }

  @override
  goToLogIn() {
    Get.offNamed(Approute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
