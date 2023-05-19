import 'dart:io';

checkinternet() async {
  try {
    var internet = await InternetAddress.lookup("google.com");
    if (internet.isNotEmpty && internet[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
