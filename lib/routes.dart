import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/view/screen/auth/forgetpassword.dart';
import 'package:flutter_eticaret/view/screen/auth/login.dart';
import 'package:flutter_eticaret/view/screen/auth/okresetpassword.dart';
import 'package:flutter_eticaret/view/screen/auth/oksignup.dart';
import 'package:flutter_eticaret/view/screen/auth/resetpassword.dart';
import 'package:flutter_eticaret/view/screen/auth/signup.dart';
import 'package:flutter_eticaret/view/screen/auth/verifycode.dart';
import 'package:flutter_eticaret/view/screen/auth/verifycodesignup.dart';
import 'package:flutter_eticaret/view/screen/home.dart';
import 'package:flutter_eticaret/view/screen/homescreens.dart';
import 'package:flutter_eticaret/view/screen/language.dart';
import 'package:flutter_eticaret/view/screen/onboarding.dart';
import 'package:get/get.dart';

import 'core/middleware/middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  //login
  GetPage(name: Approute.login, page: () => const Login()),
  GetPage(name: Approute.signup, page: () => const Signup()),
  GetPage(name: Approute.forgetpassword, page: () => const Forgetpasword()),
  GetPage(name: Approute.verifycode, page: () => const Verifycode()),
  GetPage(name: Approute.resetpassword, page: () => const Resetpassword()),
  GetPage(name: Approute.okresetpassword, page: () => const Okresetpassword()),
  GetPage(name: Approute.oksignup, page: () => const Oksignup()),
  GetPage(
      name: Approute.verifycodesignup, page: () => const Verifycodesignup()),
//onboarding
  GetPage(name: Approute.onboarding, page: () => const Onboarding()),
  //home
  GetPage(name: Approute.homepage, page: () => const Homescreens()),
];
