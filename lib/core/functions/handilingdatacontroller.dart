import 'package:flutter_eticaret/core/class/statusrequest.dart';

handilingdata(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
