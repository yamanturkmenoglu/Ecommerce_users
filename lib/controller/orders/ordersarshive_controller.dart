import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/handilingdatacontroller.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/datasource/remote/orders/ordersarshivedata.dart';
import 'package:flutter_eticaret/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersArshiveController extends GetxController {
  OrdersArshiveData ordersArshiveData = OrdersArshiveData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "Kurye ile";
    } else {
      return "Mağzadan Teslimat";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Nakit";
    } else {
      return "Online Kart İle";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Siparişiniz Alındı Onay bekliyor";
    } else if (val == "1") {
      return "Sipariş Hazırlanıyor";
    } else if (val == "2") {
      return "Teslimat görevlisi tarafından alınmaya hazır";
    } else if (val == "3") {
      return "Yolda";
    } else {
      return "Tesilm edildi";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArshiveData
        .arshiveData(myServices.sharedPreferences.getString("usersid")!);
    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  submitRating(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArshiveData.ratingData(
        ordersid, comment, rating.toString());
    print("=============================== Controller $response ");
    statusRequest = handilingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getOrders();
        statusRequest = StatusRequest.bos;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
