import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class Homedatarand {
  Requestbackenddata requestbackenddata;

  Homedatarand(this.requestbackenddata);

  getrandData() async {
    var response = await requestbackenddata.postData(Applink.homepage2, {});
    return response.fold((l) => l, (r) => r);
  }
}
