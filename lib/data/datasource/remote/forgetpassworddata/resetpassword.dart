import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class Resetpassworddata {
  Requestbackenddata requestbackenddata;

  Resetpassworddata(this.requestbackenddata);

  postdata(String email, String password) async {
    var response = await requestbackenddata.postData(
        Applink.resetpassword, {"email": email, "password": password});

    return response.fold((l) => l, (r) => r);
  }
}
