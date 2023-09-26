import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eticaret/controller/cart_controller.dart';
import 'package:flutter_eticaret/controller/homecreen_controller.dart';
import 'package:flutter_eticaret/controller/myfavorite_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/exitapp.dart';
import 'package:flutter_eticaret/view/widget/home/home_bottombar.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

class Homescreens extends StatelessWidget {
  const Homescreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenControllerImp());
    Get.put(MyFavoriteController());
    Get.put(CartController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Appcolor.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: GetBuilder<HomescreenControllerImp>(
        builder: (controller) => Scaffold(
            bottomNavigationBar: const HomeBottomAppBar(),
            body: WillPopScope(
                child: controller.listPage.elementAt(controller.currentpage),
                onWillPop: () {
                  alertExitApp();
                  return Future.value(false);
                })),
      ),
    );
  }
}
