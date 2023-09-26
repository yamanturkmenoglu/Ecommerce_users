import 'package:flutter/material.dart';
import 'package:flutter_eticaret/controller/homepage_controller.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/items_data.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(
    String categoryid,
  );
  goToProdutScreen(Itemsmodel itemsmodel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  String? catid;
  int? selectedCat;
  Itemsdata testdata = Itemsdata(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testdata.getData(
        categoryid, myServices.sharedPreferences.getString("usersid")!);
    print(
        "====================================================controller $response");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProdutScreen(itemsmodel) {
    Get.toNamed("productscreen", arguments: {"itemsmodel": itemsmodel});
  }
}
