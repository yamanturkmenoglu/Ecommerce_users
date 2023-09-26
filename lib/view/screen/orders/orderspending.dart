import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/orders/orderspending_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/data/model/ordersmodel.dart';
import 'package:flutter_eticaret/view/widget/orders/orderslistcard.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersPanding extends StatelessWidget {
  const OrdersPanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolor.white,
        centerTitle: true,
        title: const Text(
          "Siparişlerim",
          style: TextStyle(
            fontSize: 24, // Yazı tipini büyüttük
            color: Appcolor.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          color: Appcolor.white,
          child: GetBuilder<OrdersPendingController>(
              builder: (controller) => Handilingdataview(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => CardOrdersList(
                            listdata: controller.data[index],
                          ))))),
    );
  }
}
