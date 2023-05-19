import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/class/handilingdataview.dart';
import 'package:flutter_eticaret/view/widget/home/home_appbar.dart';
import 'package:flutter_eticaret/view/widget/home/listcategories.dart';
import 'package:flutter_eticaret/view/widget/home/listitemshome.dart';
import 'package:flutter_eticaret/view/widget/home/swipercardhome.dart';
import 'package:flutter_eticaret/view/widget/home/titleonehome.dart';

import 'package:get/get.dart';

import '../../controller/homepage_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Handilingdataview(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(children: [
                  // ignore: prefer_const_constructors
                  Homeappbar(
                    titleappbar: "57".tr,
                    onPressedIcon: () {},
                    onPressedSearch: () {},
                  ),
                  // ignore: prefer_const_constructors
                  Swipercardhome(
                    titel: "58".tr,
                    subtitle: "59".tr,
                  ),
                  const Titleonehome(title: "categories"),
                  const SizedBox(height: 5),
                  const Listcategories(),
                  const SizedBox(height: 5),
                  Titleonehome(title: "60".tr),
                  const SizedBox(height: 10),
                  const Listitemshome(),
                  //const SizedBox(height: 10),
                  Titleonehome(title: "61".tr),
                  const SizedBox(height: 5),
                  const Listitemshome(),
                ]))));
  }
}
