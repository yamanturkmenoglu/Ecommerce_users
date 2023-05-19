import 'package:get/get.dart';

import '../../core/constant/route.dart';

abstract class Oksignupcontroller extends GetxController {
  goTologin();
}

class OksignupcontrollerImp extends Oksignupcontroller {
  @override
  goTologin() {
    Get.offAllNamed(Approute.login);
  }
}
