import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class OrdersDetailsData {
  Requestbackenddata requestbackenddata;

  OrdersDetailsData(this.requestbackenddata);

  getData(String id) async {
    var response =
        await requestbackenddata.postData(Applink.ordersdetails, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
