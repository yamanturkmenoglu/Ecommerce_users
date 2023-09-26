import 'package:flutter_eticaret/linkipa.dart';
import '../../../core/class/requestbackend.dart';

class CheckoutData {
  Requestbackenddata requestbackenddata;

  CheckoutData(this.requestbackenddata);

  checkout(Map data) async {
    var response = await requestbackenddata.postData(Applink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
