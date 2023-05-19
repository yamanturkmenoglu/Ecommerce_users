import 'package:get/get.dart';

import '../../core/constant/route.dart';

abstract class Okresetpasswordcontroller extends GetxController {
  goTologin();
}

class OkresetpasswordcontrollerImp extends Okresetpasswordcontroller {
  @override
  goTologin() {
    Get.offAllNamed(Approute.login);
  }
}
