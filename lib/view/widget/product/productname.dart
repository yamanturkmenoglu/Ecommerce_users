import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/product_screen_controller.dart';
import 'package:flutter_eticaret/core/functions/translatedatabase.dart';
import 'package:get/get.dart';

class ProductName extends GetView<ProductScreencontrollerIpm> {
  const ProductName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${translateDatabase(controller.itemsmodel.itemsNameTr, controller.itemsmodel.itemsNameTr)}",
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}
