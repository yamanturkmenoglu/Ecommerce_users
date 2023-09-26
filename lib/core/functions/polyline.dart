import 'dart:convert';

import 'package:flutter_eticaret/core/constant/colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Set<Polyline> polylineSet = {};
List<LatLng> polylineco = [];
PolylinePoints polylinePoints = PolylinePoints();

String key = "AIzaSyDtWvTqn4jwSFj8tvvcBLgoa8naJ03IV2g";

Future<void> getPolyLine(lat, long, destlat, destlong) async {
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=$key";

  var response = await http.post(Uri.parse(url));

  var responsebody = jsonDecode(response.body);

  var point = responsebody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);

  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }

  Polyline polyline = Polyline(
      polylineId: PolylineId("yaman"),
      color: Appcolor.orange,
      width: 5,
      points: polylineco);
  polylineSet.add(polyline);
}
