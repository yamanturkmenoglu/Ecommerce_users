import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/login/resetpassword_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/view/widget/login/bodylogin.dart';
import 'package:flutter_eticaret/view/widget/login/bottomlogin.dart';
import 'package:flutter_eticaret/view/widget/login/textfromfildlogin.dart';
import 'package:flutter_eticaret/view/widget/login/textfromfildloginpassword.dart';
import 'package:flutter_eticaret/view/widget/login/titellogin.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../core/localization/changelanguage.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ResetpasswordcontrollerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.white,
          elevation: 0.0,
          title: Text(
            "27".tr,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: GetBuilder<ResetpasswordcontrollerImp>(
            builder: (controller) => Handilingdataviewrequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  color: Appcolor.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 50),
                      Titellogin(
                        text: "28".tr,
                      ),
                      Bodylogin(text: "29".tr),
                      const SizedBox(height: 18),
                      GetBuilder<ResetpasswordcontrollerImp>(
                          builder: ((controller) => Textfromfildloginpassword(
                                obscureText: controller.showpassword,
                                onTapicon: () {
                                  controller.funcshowpassword();
                                },
                                iconpass: Icons.remove_red_eye_outlined,
                                mycontroller: controller.password,
                                hinttext: "13".tr,
                                iconData: Icons.lock,
                              ))),
                      GetBuilder<ResetpasswordcontrollerImp>(
                          builder: ((controller) => Textfromfildloginpassword(
                                obscureText: controller.showpassword,
                                onTapicon: () {
                                  controller.funcshowpassword();
                                },
                                iconpass: Icons.remove_red_eye_outlined,
                                mycontroller: controller.repassword,
                                hinttext: "30".tr,
                                iconData: Icons.lock,
                              ))),
                      const SizedBox(height: 80),
                      Bottumlogin(
                        text: "31".tr,
                        onPressed: () {
                          controller.goTookresetpassword();
                        },
                      ),
                      const SizedBox(height: 50),
                    ]),
                  ),
                ))));
  }
}
