import 'package:flutter_eticaret/linkipa.dart';
import '../../../../core/class/requestbackend.dart';

class Signupdata {
  Requestbackenddata requestbackenddata;

  Signupdata(this.requestbackenddata);

  postdata(String username, String password, String email, String phone) async {
    var response = await requestbackenddata.postData(Applink.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });

    return response.fold((l) => l, (r) => r);
  }
}
