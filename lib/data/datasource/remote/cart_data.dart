import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class Cartdata {
  Requestbackenddata requestbackenddata;

  Cartdata(this.requestbackenddata);

  addCart(String usersid, String itemsid) async {
    var response = await requestbackenddata
        .postData(Applink.cartAdd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersid, String itemsid) async {
    var response = await requestbackenddata
        .postData(Applink.cartRemove, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await requestbackenddata.postData(
        Applink.cartgetcountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await requestbackenddata.postData(Applink.cartView, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response = await requestbackenddata.postData(Applink.checkcoupon, {
      "couponname": couponname,
    });
    return response.fold((l) => l, (r) => r);
  }
}
