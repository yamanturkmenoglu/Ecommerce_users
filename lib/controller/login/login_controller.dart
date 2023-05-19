import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/logindata/login.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetpassword();
}

class LoginControllerImp extends LoginController {
  Logindata logindata = Logindata(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool showpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.bos;

  funcshowpassword() {
    showpassword = showpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postdata(
        email.text,
        password.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handilingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("usersid", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(Approute.homepage);
        } else {
          Get.defaultDialog(
              title: "53".tr,
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

  @override
  goToSignUp() {
    Get.offNamed(Approute.signup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetpassword() {
    Get.offNamed(Approute.forgetpassword);
  }
}
