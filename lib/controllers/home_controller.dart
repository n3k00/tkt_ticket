import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tkt_ticket/views/login_page.dart';
import 'package:tkt_ticket/views/ways_page.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  DateFormat format = DateFormat('dd-MM-yyyy');

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

  void logOut() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(LoginPage.id);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    /// close tab controller
    tabController!.dispose();
  }

  selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023), // - not to allow to choose before today.
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(formattedDate);
      Get.to(() => WaysPage(date: formattedDate));
    } else {
      print("Date is not selected");
    }
  }
}
