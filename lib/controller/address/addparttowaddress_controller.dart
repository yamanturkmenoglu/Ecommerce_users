import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/address_data.dart';
import 'package:get/get.dart';

class AddAdressPartTowController extends GetxController {
  StatusRequest statusRequest = StatusRequest.bos;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("usersid")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);

    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(Approute.homepage);
        Get.snackbar('ADRESLERİM',
            'Bu Adresi Kullanarak Siparişlerinizi Yapabilirsiniz ;)',
            colorText: Appcolor.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 2),
            backgroundColor: Appcolor.orange,
            margin: const EdgeInsets.all(30),
            icon: const Icon(
              Icons.thumb_up,
              color: Appcolor.white,
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
