import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/login/verifycode_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/view/widget/login/bodylogin.dart';
import 'package:flutter_eticaret/view/widget/login/titellogin.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verifycode extends StatelessWidget {
  const Verifycode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodecontrollerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.white,
          elevation: 0.0,
          title: Text(
            "24".tr,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: GetBuilder<VerifycodecontrollerImp>(
            builder: (controller) => Handilingdataviewrequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  color: Appcolor.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  child: ListView(children: [
                    const SizedBox(height: 50),
                    Titellogin(
                      text: "25".tr,
                    ),
                    Bodylogin(text: "26".tr),
                    const SizedBox(height: 18),
                    OtpTextField(
                      fieldWidth: 56,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Appcolor.gribox,
                      numberOfFields: 5,
                      focusedBorderColor: Appcolor.orange,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.goToresetpassword(verificationCode);
                      },
                    ),
                    const SizedBox(height: 80),
                  ]),
                ))));
  }
}
