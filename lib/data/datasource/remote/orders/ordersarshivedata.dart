import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class OrdersArshiveData {
  Requestbackenddata requestbackenddata;

  OrdersArshiveData(this.requestbackenddata);

  arshiveData(String usersid) async {
    var response = await requestbackenddata
        .postData(Applink.ordersarshive, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

  ratingData(String ordersid, String comment, String rating) async {
    var response = await requestbackenddata.postData(
        Applink.rating, {"id": ordersid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
