import 'package:flutter_eticaret/linkipa.dart';
import '../../../../core/class/requestbackend.dart';

class Verifycodesignupdata {
  Requestbackenddata requestbackenddata;

  Verifycodesignupdata(this.requestbackenddata);

  postdata(String email, String verifycode) async {
    var response = await requestbackenddata.postData(Applink.verifycodesignup, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
