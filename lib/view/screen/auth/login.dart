import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/login/login_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';

import 'package:flutter_eticaret/core/functions/exitapp.dart';
import 'package:flutter_eticaret/core/functions/validinput.dart';
import 'package:flutter_eticaret/view/widget/login/bodylogin.dart';
import 'package:flutter_eticaret/view/widget/login/bottomlogin.dart';
import 'package:flutter_eticaret/view/widget/login/logologin.dart';
import 'package:flutter_eticaret/view/widget/login/textfromfildlogin.dart';
import 'package:flutter_eticaret/view/widget/login/textfromfildloginpassword.dart';
import 'package:flutter_eticaret/view/widget/login/textsignup.dart';
import 'package:flutter_eticaret/view/widget/login/titellogin.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolor.white,
        elevation: 0.0,
        title: Text(
          "9".tr,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
              builder: (controller) => Handilingdataviewrequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    color: Appcolor.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 35),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: [
                        const Logologin(),
                        const SizedBox(height: 20),
                        Titellogin(
                          text: "10".tr,
                        ),
                        Bodylogin(text: "11".tr),
                        const SizedBox(height: 18),
                        Textfromfildlogin(
                          isnumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          iconData: Icons.mail,
                        ),
                        GetBuilder<LoginControllerImp>(
                            builder: (controller) => Textfromfildloginpassword(
                                  obscureText: controller.showpassword,
                                  onTapicon: () {
                                    controller.funcshowpassword();
                                  },
                                  mycontroller: controller.password,
                                  iconpass: Icons.remove_red_eye_outlined,
                                  hinttext: "13".tr,
                                  iconData: Icons.lock,
                                )),
                        InkWell(
                          onTap: () {
                            controller.goToForgetpassword();
                          },
                          child: Text(
                            "14".tr,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(height: 80),
                        Bottumlogin(
                          text: "9".tr,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                        const SizedBox(height: 30),
                        Textsignupandtlogin(
                          text1: "15".tr,
                          text2: "16".tr,
                          onTap: () {
                            controller.goToSignUp();
                          },
                        ),
                      ]),
                    ),
                  )))),
    );
  }
}
