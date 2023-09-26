import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/product_screen_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/translatedatabase.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductDesc extends GetView<ProductScreencontrollerIpm> {
  const ProductDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${translateDatabase(controller.itemsmodel.itemsDescTr, controller.itemsmodel.itemsDesc)}",
      style: const TextStyle(color: Appcolor.gri),
    );
  }
}
