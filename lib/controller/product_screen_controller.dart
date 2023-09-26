import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/cart_controller.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/cart_data.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductScreencontroller extends GetxController {}

class ProductScreencontrollerIpm extends ProductScreencontroller {
  MyServices myServices = Get.find();
  Cartdata cartdata = Cartdata(Get.find());
  CartController cartController = Get.put(CartController());

  late Itemsmodel itemsmodel;

  late StatusRequest statusRequest;

  int countitems = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsmodel = Get.arguments['itemsmodel'];
    countitems = await getCountItemsCart(itemsmodel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  getCountItemsCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartdata.getCountCart(
        myServices.sharedPreferences.getString("usersid")!, itemsid);
    print(
        "====================================================controller $response");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("=================================");
        print("$countitems");
        return countitems;
        //  data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  addToCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.addCart(
        myServices.sharedPreferences.getString("usersid")!, itemsid);
    print(
        "====================================================controller $response");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar('Sepetim', 'ürün Sepete eklendi ;)',
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
    update();
  }

  removeOnCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartdata.removeCart(
        myServices.sharedPreferences.getString("usersid")!, itemsid);
    print(
        "====================================================controller $response");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar('Sepetim', 'ürün sepetten çıkarıldı ;)',
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
    update();
  }

  add() {
    addToCart(itemsmodel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      removeOnCart(itemsmodel.itemsId!);
      countitems--;
      update();
    }
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  void goToProdutScreen(Itemsmodel itemsmodel) {}
}
