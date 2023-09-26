import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/product_screen_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:get/get.dart';

class ColorListPrpduct extends GetView<ProductScreencontrollerIpm> {
  const ColorListPrpduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            controller.subitems.length,
            (index) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: controller.subitems[index]['active'] == "1"
                        ? Appcolor.orange
                        : Appcolor.white,
                    border: Border.all(color: Appcolor.gri, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    controller.subitems[index]['name'],
                    style: TextStyle(
                        color: controller.subitems[index]['active'] == "1"
                            ? Appcolor.white
                            : Appcolor.black,
                        fontWeight: FontWeight.bold),
                  ),
                )),
      ],
    );
  }
}
