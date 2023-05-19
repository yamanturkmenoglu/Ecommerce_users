import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:get/get.dart';

class Initialbaindins extends Bindings {
  @override
  void dependencies() {
    Get.put(Requestbackenddata());
  }
}
