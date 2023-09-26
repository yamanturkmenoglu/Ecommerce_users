import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Favoritedata favoritedata = Favoritedata(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isFavorite = {};

  //key => id items
  // value=> 1or0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoritedata.addFavorite(
        myServices.sharedPreferences.getString("usersid")!, itemsid);
    print(
        "====================================================controller $response");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar('Favorilerim', 'ürün fevorilerime eklendi ;)',
            colorText: Appcolor.white,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 1),
            backgroundColor: Appcolor.orange,
            margin: const EdgeInsets.all(30),
            icon: const Icon(
              Icons.thumb_up,
              color: Appcolor.white,
            ));
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoritedata.removeFavorite(
        myServices.sharedPreferences.getString("usersid")!, itemsid);
    print(
        "====================================================controller $response");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar('favorilerim', 'ürün fevorilerim den çıkarıldı ;)',
            colorText: Appcolor.white,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 1),
            backgroundColor: Appcolor.orange,
            margin: const EdgeInsets.all(30),
            icon: const Icon(
              Icons.thumb_up,
              color: Appcolor.white,
            ));
        //  data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
