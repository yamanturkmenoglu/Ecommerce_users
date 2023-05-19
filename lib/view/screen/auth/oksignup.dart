import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/login/oksignup_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:flutter_eticaret/view/widget/login/bottomlogin.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Oksignup extends StatelessWidget {
  const Oksignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OksignupcontrollerImp controller = Get.put(OksignupcontrollerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolor.white,
        elevation: 0.0,
        title: Text("32".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Appcolor.gri)),
      ),
      body: Container(
        color: Appcolor.white,
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Center(
              child: Lottie.asset(AppImageasset.success,
                  width: 200, height: 200, repeat: false)),
          const SizedBox(
            height: 30,
          ),
          Text("33".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("38".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: Bottumlogin(
                text: "35".tr,
                onPressed: () {
                  controller.goTologin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
