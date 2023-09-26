import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/homecreen_controller.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenControllerImp>(
        builder: (controller) => WaterDropNavBar(
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
                  filledIcon: Icons.settings,
                  outlinedIcon: Icons.settings_outlined,
                ),
              ],
              onItemSelected: (int index) {
                controller.changePage(index);
              },
              selectedIndex: controller.currentpage,
            ));
  }
}
