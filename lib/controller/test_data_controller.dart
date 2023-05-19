import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class Testcontroller extends GetxController {
  Testdata testdata = Testdata(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testdata.getData();
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
  void onInit() {
    getData();
    super.onInit();
  }
}
