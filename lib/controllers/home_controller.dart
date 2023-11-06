import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  /// generate previous 7 days,today  and next 7 days
  var dates = List<DateTime>.generate(
    15,
    (i) => DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(Duration(days: i - 7)),
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    /// initialized tab controller
    tabController =
        TabController(length: dates.length, vsync: this, initialIndex: 7);
  }

  /// convert eng weekday to my weekday
  String convertWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return "တနင်္လာ";
      case 2:
        return "အင်္ဂါ";
      case 3:
        return "ဗုဒ္ဓဟူး";
      case 4:
        return "ကြာသပတေး";
      case 5:
        return "သောကြာ";
      case 6:
        return "စနေ";
      case 7:
        return "တနင်္ဂနွေ";
    }
    return "ရာဟု";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    /// close tab controller
    tabController!.dispose();
  }
}
