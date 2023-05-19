import 'package:flutter_eticaret/linkipa.dart';
import '../../../core/class/requestbackend.dart';

class Testdata {
  Requestbackenddata requestbackenddata;

  Testdata(this.requestbackenddata);

  getData() async {
    var response = await requestbackenddata.postData(Applink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
