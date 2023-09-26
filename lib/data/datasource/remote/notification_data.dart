import 'package:flutter_eticaret/core/class/requestbackend.dart';
import 'package:flutter_eticaret/linkipa.dart';

class NotificationData {
  Requestbackenddata requestbackenddata;

  NotificationData(this.requestbackenddata);

  notifiData(String id) async {
    var response =
        await requestbackenddata.postData(Applink.notification, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
