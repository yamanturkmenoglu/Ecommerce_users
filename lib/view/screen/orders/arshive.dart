import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/orders/ordersarshive_controller.dart';
import 'package:flutter_eticaret/controller/orders/orderspending_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/view/widget/orders/orderslistcard.dart';
import 'package:flutter_eticaret/view/widget/orders/orderslistcardarshive.dart';
import 'package:get/get.dart';

class OrdersArshive extends StatelessWidget {
  const OrdersArshive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArshiveController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolor.white,
        centerTitle: true,
        title: const Text(
          "Arşiv",
          style: TextStyle(
            fontSize: 24, // Yazı tipini büyüttük
            color: Appcolor.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          color: Appcolor.white,
          child: GetBuilder<OrdersArshiveController>(
              builder: (controller) => Handilingdataview(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => CardOrdersListArshive(
                            listdata: controller.data[index],
                          ))))),
    );
  }
}
