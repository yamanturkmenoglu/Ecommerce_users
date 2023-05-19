import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/test_data_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Testcontroller());
    return Scaffold(
        appBar: AppBar(title: const Text("Title")),
        body: GetBuilder<Testcontroller>(builder: (controller) {
          return Handilingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) {
                  return Text("${controller.data}");
                }),
              ));
        }));
  }
}
