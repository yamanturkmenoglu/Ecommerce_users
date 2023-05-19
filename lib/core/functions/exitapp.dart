import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "47".tr,
      titleStyle: const TextStyle(color: Appcolor.orange, fontSize: 26),
      middleText: "48".tr,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Appcolor.orange)),
            onPressed: () {
              exit(0);
            },
            child: Text("49".tr)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Appcolor.orange)),
            onPressed: () {
              Get.back();
            },
            child: Text("50".tr))
      ]);
  return Future.value(true);
}
