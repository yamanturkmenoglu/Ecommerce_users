import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/myfavorite_data.dart';
import 'package:flutter_eticaret/data/model/Myfavorite.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoritedata favoritedata = MyFavoritedata(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getdata() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoritedata
        .getData(myServices.sharedPreferences.getString("usersid")!);
    print(
        "====================================================controller $response");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    var response = favoritedata.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }

  void updateData() {
    data.clear(); // Mevcut verileri temizle
    getdata(); // Yeni verileri getir
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
