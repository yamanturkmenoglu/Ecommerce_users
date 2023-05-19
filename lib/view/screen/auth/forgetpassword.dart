import 'package:flutter/material.dart';
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
import '../../../controller/login/forgetpassword_controller.dart';
import '../../../core/functions/validinput.dart';

class Forgetpasword extends StatelessWidget {
  const Forgetpasword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetpasswordcontrollerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.white,
          elevation: 0.0,
          title: Text(
            "20".tr,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: GetBuilder<ForgetpasswordcontrollerImp>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? Center(
                        child: Lottie.asset(AppImageasset.loading,
                            width: 250, height: 250))
                    : Container(
                        color: Appcolor.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(children: [
                            const SizedBox(height: 50),
                            Titellogin(
                              text: "21".tr,
                            ),
                            Bodylogin(text: "22".tr),
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
                            const SizedBox(height: 80),
                            Bottumlogin(
                              text: "23".tr,
                              onPressed: () {
                                controller.checkemail();
                              },
                            ),
                            const SizedBox(height: 50),
                          ]),
                        ),
                      )));
  }
}
