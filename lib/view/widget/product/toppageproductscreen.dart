import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/product_screen_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/linkipa.dart';
import 'package:get/get.dart';

class TopPageProductScreen extends GetView<ProductScreencontrollerIpm> {
  const TopPageProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Appcolor.white,
          height: 400,
        ),
        Center(
          child: Hero(
            tag: "${controller.itemsmodel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${Applink.imagesitems}/${controller.itemsmodel.itemsImage!}",
              height: 400,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
