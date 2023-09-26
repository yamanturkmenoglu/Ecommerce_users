import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class HomeTopSellingData {
  Requestbackenddata requestbackenddata;

  HomeTopSellingData(this.requestbackenddata);

  getTopsellingData() async {
    var response =
        await requestbackenddata.postData(Applink.homeTopselling, {});
    return response.fold((l) => l, (r) => r);
  }
}
