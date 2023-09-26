import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/view/screen/address/add.dart';
import 'package:flutter_eticaret/view/screen/address/addpart2.dart';
import 'package:flutter_eticaret/view/screen/address/view.dart';
import 'package:flutter_eticaret/view/screen/auth/forgetpassword.dart';
import 'package:flutter_eticaret/view/screen/auth/login.dart';
import 'package:flutter_eticaret/view/screen/auth/okresetpassword.dart';
import 'package:flutter_eticaret/view/screen/auth/oksignup.dart';
import 'package:flutter_eticaret/view/screen/auth/resetpassword.dart';
import 'package:flutter_eticaret/view/screen/auth/signup.dart';
import 'package:flutter_eticaret/view/screen/auth/verifycode.dart';
import 'package:flutter_eticaret/view/screen/auth/verifycodesignup.dart';
import 'package:flutter_eticaret/view/screen/cart.dart';
import 'package:flutter_eticaret/view/screen/chcekout.dart';
import 'package:flutter_eticaret/view/screen/homescreens.dart';
import 'package:flutter_eticaret/view/screen/items.dart';
import 'package:flutter_eticaret/view/screen/language.dart';
import 'package:flutter_eticaret/view/screen/myfavorite.dart';
import 'package:flutter_eticaret/view/screen/notification.dart';
import 'package:flutter_eticaret/view/screen/onboarding.dart';
import 'package:flutter_eticaret/view/screen/orders/arshive.dart';
import 'package:flutter_eticaret/view/screen/orders/ordersdetails.dart';
import 'package:flutter_eticaret/view/screen/orders/orderspending.dart';
import 'package:flutter_eticaret/view/screen/productscreen.dart';
import 'package:flutter_eticaret/view/screen/profile.dart';
import 'package:flutter_eticaret/view/widget/orders/tracking.dart';
import 'package:get/get.dart';

import 'core/middleware/middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  //GetPage(name: "/", page: () => Cart()),
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
  GetPage(name: Approute.items, page: () => const Items()),
  GetPage(name: Approute.productscreen, page: () => const ProductScreen()),
  GetPage(name: Approute.myfavorite, page: () => const MyFavorite()),
  GetPage(name: Approute.profile, page: () => const Profile()),
  GetPage(name: Approute.cart, page: () => const Cart()),
  //address
  GetPage(name: Approute.addressview, page: () => const AddressView()),
  GetPage(name: Approute.addressadd, page: () => const AddAddress()),
  GetPage(
      name: Approute.addressaddparttow, page: () => const AddPartTowAddress()),
  GetPage(name: Approute.checkout, page: () => const ChcekOutcart()),
  GetPage(name: Approute.orderspanding, page: () => const OrdersPanding()),
  GetPage(
      name: Approute.notificationpage, page: () => const NotificationView()),
  GetPage(name: Approute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: Approute.ordersarshive, page: () => const OrdersArshive()),
  GetPage(name: Approute.ordertracking, page: () => const OrdersTracking()),
];
