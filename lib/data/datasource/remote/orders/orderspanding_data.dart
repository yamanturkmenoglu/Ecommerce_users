import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class OrdersPendingData {
  Requestbackenddata requestbackenddata;

  OrdersPendingData(this.requestbackenddata);

  getData(String usersid) async {
    var response = await requestbackenddata
        .postData(Applink.pendingorders, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await requestbackenddata
        .postData(Applink.ordersdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
