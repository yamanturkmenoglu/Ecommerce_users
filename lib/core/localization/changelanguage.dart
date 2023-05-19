import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

//dil ayarı için getx ve sharedPreferences
//kullanıcı uygulamayı ilk kullanmada sunduğmuz dil seçenekleri kullanıcak ve seçilen dile göre uyugulamanın dili olacak
//getx ve sharedPreferences sayesinde kayıd edilecek ve tekrar kullancıya sormıyacak
//uygulamanın ilk açılışında cihazın dil ile dil seçmesini istenecek
class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "tr") {
      language = const Locale("tr");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
