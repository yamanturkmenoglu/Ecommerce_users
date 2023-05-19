import 'package:flutter_eticaret/linkipa.dart';
import '../../../../core/class/requestbackend.dart';

class Logindata {
  Requestbackenddata requestbackenddata;

  Logindata(this.requestbackenddata);

  postdata(String email, String password) async {
    var response = await requestbackenddata
        .postData(Applink.login, {"email": email, "password": password});

    return response.fold((l) => l, (r) => r);
  }
}
