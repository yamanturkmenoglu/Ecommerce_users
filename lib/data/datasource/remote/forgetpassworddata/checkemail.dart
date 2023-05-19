import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class Checkemaildata {
  Requestbackenddata requestbackenddata;

  Checkemaildata(this.requestbackenddata);

  postdata(String email) async {
    var response =
        await requestbackenddata.postData(Applink.checkemail, {"email": email});

    return response.fold((l) => l, (r) => r);
  }
}
