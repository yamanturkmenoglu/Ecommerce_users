import 'package:flutter_eticaret/linkipa.dart';
import '../../../core/class/requestbackend.dart';

class MyFavoritedata {
  Requestbackenddata requestbackenddata;

  MyFavoritedata(this.requestbackenddata);

  getData(
    String id,
  ) async {
    var response =
        await requestbackenddata.postData(Applink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(
    String id,
  ) async {
    var response = await requestbackenddata
        .postData(Applink.deletefrommyfavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
