import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "39".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "40".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "41".tr;
    }
  }

  if (val.isEmpty) {
    return "42".tr;
  }
  if (val.length < min) {
    return "43 $min".tr;
  }

  if (val.length > max) {
    return "44 $max".tr;
  }
}
