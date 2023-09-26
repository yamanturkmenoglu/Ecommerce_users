import 'package:flutter/widgets.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/data/datasource/remote/homedata.dart';
import 'package:flutter_eticaret/data/datasource/remote/homeranddata.dart';
import 'package:flutter_eticaret/data/datasource/remote/hometopsellingdata.dart';
import 'package:flutter_eticaret/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handilingdatacontroller.dart';
import '../core/services/services.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  getranddata();
  getTopselingdata();
  goToitems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String titlehomeCard = "";
  String bodyhomecard = "";
  HomeTopSellingData homeTopSellingData = HomeTopSellingData(Get.find());
  Homedatarand homedatarand = Homedatarand(Get.find());
  Homedata homedata = Homedata(Get.find());
  List data = [];
  List categories = [];
  List items = [];
  List itemsrand = [];
  List topsellingitems = [];
  List settingdata = [];
  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    getranddata();
    getTopselingdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=================0000000000============== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingdata.addAll(response['settings']['data']);
        titlehomeCard = settingdata[0]['settings_titlehome'];
        bodyhomecard = settingdata[0]['settings_bodyhome'];
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getranddata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedatarand.getrandData();
    print("===================111111111============ Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //categories.addAll(response['categories']['data']);
        itemsrand.addAll(response['items_rand']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getTopselingdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeTopSellingData.getTopsellingData();
    print("===================2222222============ Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //categories.addAll(response['categories']['data']);
        topsellingitems.addAll(response['items_top']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToitems(categories, selectedCat, categoryid) {
    Get.toNamed(Approute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToProdutScreen(itemsmodel) {
    Get.toNamed("productscreen", arguments: {"itemsmodel": itemsmodel});
  }
}

class SearchMixController extends GetxController {
  TextEditingController? search;
  List<Itemsmodel> listdata = [];
  bool isSearch = false;
  late StatusRequest statusRequest;
  Homedata homedata = Homedata(Get.find());
  chechsearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.bos;
      isSearch = false;
    }
    update();
  }

  onSearchitems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
