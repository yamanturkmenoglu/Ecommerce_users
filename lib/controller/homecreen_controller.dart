import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/myfavorite_controller.dart';
import 'package:flutter_eticaret/view/screen/cart.dart';

import 'package:flutter_eticaret/view/screen/home.dart';
import 'package:flutter_eticaret/view/screen/myfavorite.dart';
import 'package:flutter_eticaret/view/screen/profile.dart';

import 'package:get/get.dart';

import 'cart_controller.dart';

abstract class HomescreensController extends GetxController {
  changePage(int currentpage);
}

class HomescreenControllerImp extends HomescreensController {
  int currentpage = 0;

  List<Widget> listPage = [
    const Homepage(),
    const Cart(),
    const MyFavorite(),
    const Profile(),
  ];

  @override
  void changePage(int i) {
    currentpage = i;
    if (i == 1 || i == 2) {
      updateData();
    }

    update();
  }

  void updateData() {
    MyFavoriteController myFavoriteController = Get.find();
    myFavoriteController.updateData();
    CartController cartController =
        Get.put(CartController()); // CartController'ı çağırın
    cartController.view();
  }
}
