import 'package:flutter_eticaret/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columntr, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "tr") {
    return columntr;
  } else {
    return columnen;
  }
}
