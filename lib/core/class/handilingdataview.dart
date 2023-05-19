import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eticaret/core/class/statusrequest.dart';
import 'package:flutter_eticaret/core/constant/imageasset.dart';
import 'package:lottie/lottie.dart';

class Handilingdataview extends StatelessWidget {
  const Handilingdataview({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageasset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageasset.offline,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageasset.server,
                        width: 250, height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageasset.nodata,
                            width: 250, height: 250))
                    : widget;
  }
}

class Handilingdataviewrequest extends StatelessWidget {
  const Handilingdataviewrequest({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageasset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageasset.offline,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageasset.server,
                        width: 250, height: 250))
                : widget;
  }
}
