import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/route.dart';
import 'package:flutter_eticaret/core/functions/polyline.dart';
import 'package:flutter_eticaret/core/services/services.dart';
import 'package:flutter_eticaret/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  GoogleMapController? gmc;

  List<Marker> markers = [];

  late OrdersModel ordersModel;

  CameraPosition? cameraPosition;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.success;

  double? destlat;
  double? destlong;

  double? currentlat;
  double? currentlong;

  initalData() {
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!)),
      zoom: 12.4746,
    );
    markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));
  }

  initpolyline() async {
    destlat = double.parse(ordersModel.addressLat!);
    destlong = double.parse(ordersModel.addressLong!);
    await Future.delayed(Duration(seconds: 1));
    await getPolyLine(currentlat, currentlong, destlat, destlong);
    update();
  }

  getLocationdelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        destlat = event.get("lat");
        destlong = event.get("long");
        updetaMarkardelivery(destlat!, destlong!);
      }
    });
  }

  updetaMarkardelivery(double newlat, double newlong) {
    markers.removeWhere((element) => element.markerId.value == "dest");
    markers.add(Marker(
        markerId: const MarkerId("dest"), position: LatLng(newlat, newlat)));
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initalData();
    /* initpolyline(); */
    getLocationdelivery();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();

    super.onClose();
  }
}
