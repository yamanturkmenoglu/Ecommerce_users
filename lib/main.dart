import 'package:flutter/material.dart';
import 'package:flutter_eticaret/bindings/initialbinding.dart';
import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_eticaret/core/localization/changelanguage.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/routes.dart';
import 'package:get/get.dart';
import 'core/localization/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 26,
              color: Appcolor.orange),
          headline2: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22, color: Appcolor.gri),
          headline3: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 13, color: Appcolor.gri),
          bodyText1: TextStyle(
            height: 1.3,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        primarySwatch: const MaterialColor(0xFFF77951, {
          50: Color(0xFFFFEBEE),
          100: Color(0xFFFFCDD2),
          200: Color(0xFFEF9A9A),
          300: Color(0xFFE57373),
          400: Color(0xFFEF5350),
          500: Color(0xFFF44336),
          600: Color(0xFFE53935),
          700: Color(0xFFD32F2F),
          800: Color(0xFFC62828),
          900: Color(0xFFB71C1C),
        }),
      ),
      // home: const TestView(),
      //const Language(),
      //routes: routes,
      initialBinding: Initialbaindins(),
      getPages: routes,
    );
  }
}
