import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class Favoritedata {
  Requestbackenddata requestbackenddata;

  Favoritedata(this.requestbackenddata);

  addFavorite(String usersid, String itemsid) async {
    var response = await requestbackenddata.postData(
        Applink.favoriteAdd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await requestbackenddata.postData(
        Applink.favoriteRemove, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
