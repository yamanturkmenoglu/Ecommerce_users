import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/cart_data.dart';
import 'package:flutter_eticaret/data/model/cartmadel.dart';
import 'package:flutter_eticaret/data/model/couponmodel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  Cartdata cartData = Cartdata(Get.find());

  int? discountcoupon = 0;

  String? couponname;

  String? couponid;

  TextEditingController? controllercoupon;

  CouponModel? couponModel;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;

  addToCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("usersid")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar('Sepetim', 'Ürün Sepete Eklendi ;)',
            colorText: Appcolor.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1),
            backgroundColor: Appcolor.orange,
            margin: const EdgeInsets.all(30),
            icon: const Icon(
              Icons.thumb_up,
              color: Appcolor.white,
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  removeOnCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("usersid")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar('Sepetim', 'Ürün Sepetten Çıkarıldı ;)',
            colorText: Appcolor.white,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 1),
            backgroundColor: Appcolor.orange,
            margin: const EdgeInsets.all(30),
            icon: const Icon(
              Icons.thumb_up,
              color: Appcolor.white,
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar('Uyarı', 'Girilen Coupon Geçerli Değil',
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

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  void updateData() {
    data.clear(); // Mevcut verileri temizle
    view(); // Yeni verileri getir
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .viewCart(myServices.sharedPreferences.getString("usersid")!);
    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = double.parse(dataresponsecountprice['totalprice']);
          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageCheckout() {
    if (data.isEmpty) {
      return Get.snackbar('Sepetim', 'Sepette Ürün Yok ;)',
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
    Get.toNamed(Approute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": discountcoupon.toString()
    });
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
