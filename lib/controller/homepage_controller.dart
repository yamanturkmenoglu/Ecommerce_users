import 'package:flutter_eticaret/data/datasource/remote/homedata.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handilingdatacontroller.dart';
import '../core/services/services.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  Homedata homedata = Homedata(Get.find());
  List data = [];
  List categories = [];
  List items = [];

  late StatusRequest statusRequest;

  @override
  initialData() {}

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
