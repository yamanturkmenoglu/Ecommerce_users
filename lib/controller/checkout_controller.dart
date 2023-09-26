import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/address_data.dart';
import 'package:flutter_eticaret/data/datasource/remote/checkout_data.dart';
import 'package:flutter_eticaret/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.bos;
  MyServices myServices = Get.find();
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  String? paymentMethod;
  String? deliveryType;
  String? addressid;
  List<AddressModel> dataaddress = [];
  late String couponid;
  late String coupondiscount;
  late String priceorders;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("usersid")!);

    print("=============================== Controller $response ");

    statusRequest = handilingdata(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (dataaddress.isEmpty) {
      return Get.snackbar('Uyarı', 'Adress Eklemelisiniz Ayarlardan',
          colorText: Appcolor.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
          backgroundColor: Appcolor.orange,
          margin: const EdgeInsets.all(30),
          icon: const Icon(
            Icons.warning,
            color: Appcolor.white,
          ));
    }
    if (paymentMethod == null) {
      return Get.snackbar('Uyarı', 'Ödeme Seçeneği Seçmediniz',
          colorText: Appcolor.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
          backgroundColor: Appcolor.orange,
          margin: const EdgeInsets.all(30),
          icon: const Icon(
            Icons.warning,
            color: Appcolor.white,
          ));
    }
    if (deliveryType == null) {
      return Get.snackbar('Uyarı', 'Teslimat Seçeneği Seçmediniz',
          colorText: Appcolor.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
          backgroundColor: Appcolor.orange,
          margin: const EdgeInsets.all(30),
          icon: const Icon(
            Icons.warning,
            color: Appcolor.white,
          ));
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar('Uyarı', 'Adress Eklemelisiniz Ayarlardan',
          colorText: Appcolor.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
          backgroundColor: Appcolor.orange,
          margin: const EdgeInsets.all(30),
          icon: const Icon(
            Icons.warning,
            color: Appcolor.white,
          ));
    }

    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("usersid"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handilingdata(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(Approute.homepage);
        Get.snackbar('Sipariş', 'Siparişiniz Alındı',
            colorText: Appcolor.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1),
            backgroundColor: Appcolor.orange,
            margin: const EdgeInsets.all(30),
            icon: const Icon(
              Icons.thumb_up,
              color: Appcolor.white,
            ));
      } else {
        statusRequest = StatusRequest.bos;
        Get.snackbar('Uyarı', 'Hata Oluştu Tekrer Dene',
            colorText: Appcolor.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1),
            backgroundColor: Appcolor.orange,
            margin: const EdgeInsets.all(30),
            icon: const Icon(
              Icons.warning,
              color: Appcolor.white,
            ));
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
