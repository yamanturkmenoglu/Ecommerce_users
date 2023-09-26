import 'package:flutter_eticaret/linkipa.dart';
import '../../../core/class/requestbackend.dart';

class Itemsdata {
  Requestbackenddata requestbackenddata;

  Itemsdata(this.requestbackenddata);

  getData(String id, String userid) async {
    var response = await requestbackenddata
        .postData(Applink.items, {"id": id.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
