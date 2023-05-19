import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class Verifycodeforgetpassworddata {
  Requestbackenddata requestbackenddata;

  Verifycodeforgetpassworddata(this.requestbackenddata);

  postdata(String email, String verifycode) async {
    var response =
        await requestbackenddata.postData(Applink.verifycodeforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
