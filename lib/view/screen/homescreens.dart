import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eticaret/controller/homecreen_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

class Homescreens extends StatelessWidget {
  const Homescreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenControllerImp());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Appcolor.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: GetBuilder<HomescreenControllerImp>(
        builder: (controller) => Scaffold(
          bottomNavigationBar: WaterDropNavBar(
            waterDropColor: Appcolor.orange,
            backgroundColor: Appcolor.white,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home_rounded,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                filledIcon: Icons.shopping_basket_rounded,
                outlinedIcon: Icons.shopping_basket_outlined,
              ),
              BarItem(
                filledIcon: Icons.favorite_rounded,
                outlinedIcon: Icons.favorite_border_rounded,
              ),
              BarItem(
                filledIcon: Icons.person,
                outlinedIcon: Icons.person_outlined,
              ),
            ],
            onItemSelected: (int index) {
              controller.changePage(index);
            },
            selectedIndex: controller.currentpage,
          ),
          body: controller.listPage.elementAt(controller.currentpage),
        ),
      ),
    );
  }
}
