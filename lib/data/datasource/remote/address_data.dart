import 'package:flutter_eticaret/core/class/requestbackend.dart';

import '../../../linkipa.dart';

class AddressData {
  Requestbackenddata requestbackenddata;
  AddressData(this.requestbackenddata);
  getData(String usersid) async {
    var response = await requestbackenddata
        .postData(Applink.addressView, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await requestbackenddata.postData(Applink.addressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response = await requestbackenddata
        .postData(Applink.addressRemove, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
