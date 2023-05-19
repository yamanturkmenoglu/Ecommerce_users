import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/localization/changelanguage.dart';
import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../widget/language/botton_lang.dart';
import '../widget/language/language_custom.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Langcustom(),
                const SizedBox(
                  height: 40,
                ),
                Bottonlang(
                    textbutton: "TR",
                    onPressed: () {
                      controller.changeLang("tr");
                      Get.toNamed(Approute.onboarding);
                    }),
                Bottonlang(
                    textbutton: "EN",
                    onPressed: () {
                      controller.changeLang("en");
                      Get.toNamed(Approute.onboarding);
                    }),
              ],
            )));
  }
}
