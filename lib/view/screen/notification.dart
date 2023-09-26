import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/notification_controller.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Appcolor.white,
          centerTitle: true,
          title: const Text(
            "Bildirimler",
            style: TextStyle(
              fontSize: 24, // Yazı tipini büyüttük
              color: Appcolor.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: GetBuilder<NotificationController>(
            builder: (controller) => Handilingdataview(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView(children: [
                      const SizedBox(height: 10),
                      ...List.generate(
                          controller.data.length,
                          (index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: Stack(
                                  children: [
                                    ListTile(
                                      title: Text(controller.data[index]
                                          ['notification_title']),
                                      subtitle: Text(controller.data[index]
                                          ['notification_body']),
                                    ),
                                    Positioned(
                                        right: 5,
                                        child: Text(
                                          Jiffy(
                                                  controller.data[index]
                                                      ['notification_datetime'],
                                                  "yyyy-MM-dd")
                                              .fromNow(),
                                          style: const TextStyle(
                                              color: Appcolor.orange,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ))
                    ])))));
  }
}
