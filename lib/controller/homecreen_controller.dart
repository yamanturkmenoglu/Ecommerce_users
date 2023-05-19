import 'package:flutter/material.dart';
import 'package:flutter_eticaret/view/screen/home.dart';
import 'package:get/get.dart';

abstract class HomescreensController extends GetxController {
  changePage(int currentpage);
}

class HomescreenControllerImp extends HomescreensController {
  int currentpage = 0;

  List<Widget> listPage = [
    const Homepage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Center(child: Text("sopping basket"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Center(child: Text("favori"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Center(child: Text("profile"))],
    ),
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
