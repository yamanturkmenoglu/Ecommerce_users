import 'package:flutter_eticaret/linkipa.dart';
import '../../../core/class/requestbackend.dart';

class Homedata {
  Requestbackenddata requestbackenddata;

  Homedata(this.requestbackenddata);

  getData() async {
    var response = await requestbackenddata.postData(Applink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
