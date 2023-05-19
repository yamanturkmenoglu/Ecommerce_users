import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/login/signup_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/core/functions/exitapp.dart';
import 'package:flutter_eticaret/view/widget/login/bodylogin.dart';
import 'package:flutter_eticaret/view/widget/login/bottomlogin.dart';
import 'package:flutter_eticaret/view/widget/login/textfromfildlogin.dart';
import 'package:flutter_eticaret/view/widget/login/textfromfildloginpassword.dart';
import 'package:flutter_eticaret/view/widget/login/textsignup.dart';
import 'package:flutter_eticaret/view/widget/login/titellogin.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/functions/validinput.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.white,
          elevation: 0.0,
          title: Text(
            "16".tr,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(
                builder: ((controller) => Handilingdataviewrequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      color: Appcolor.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 35),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(children: [
                          const SizedBox(height: 50),
                          Titellogin(
                            text: "10".tr,
                          ),
                          Bodylogin(text: "11".tr),
                          const SizedBox(height: 18),
                          Textfromfildlogin(
                            isnumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 20, "username");
                            },
                            mycontroller: controller.username,
                            hinttext: "17".tr,
                            iconData: Icons.person,
                          ),
                          Textfromfildlogin(
                            isnumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 40, "email");
                            },
                            mycontroller: controller.email,
                            hinttext: "12".tr,
                            iconData: Icons.mail,
                          ),
                          Textfromfildlogin(
                            isnumber: true,
                            valid: (val) {
                              return validInput(val!, 7, 11, "phone");
                            },
                            mycontroller: controller.phone,
                            hinttext: "18".tr,
                            iconData: Icons.call,
                          ),
                          GetBuilder<SignUpControllerImp>(
                              builder: ((controller) =>
                                  Textfromfildloginpassword(
                                    obscureText: controller.showpassword,
                                    onTapicon: () {
                                      controller.funcshowpassword();
                                    },
                                    iconpass: Icons.remove_red_eye_outlined,
                                    mycontroller: controller.password,
                                    hinttext: "13".tr,
                                    iconData: Icons.lock,
                                  ))),
                          const SizedBox(height: 80),
                          Bottumlogin(
                            text: "16".tr,
                            onPressed: () {
                              controller.signUp();
                            },
                          ),
                          const SizedBox(height: 50),
                          Textsignupandtlogin(
                            text1: "19".tr,
                            text2: "9".tr,
                            onTap: () {
                              controller.goToLogIn();
                            },
                          ),
                        ]),
                      ),
                    ))))));
  }
}
