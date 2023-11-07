import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tkt_ticket/models/vo/ticket.dart';
import 'package:tkt_ticket/network/firebase_ticket_data_agent.dart';

import '../resources/strings.dart';

class DayTabBarController extends GetxController {
  var lashioToTachileikList = <TicketVO>[].obs;
  var lashioToTaunggyiList = <TicketVO>[].obs;
  var tachileikToLashioList = <TicketVO>[].obs;
  var tachileikToTaunggyiList = <TicketVO>[].obs;
  var taunggyiToTachileikList = <TicketVO>[].obs;
  var taunggyiToLashioList = <TicketVO>[].obs;
  var isExpand = true.obs;

  void fetchDataFromFirebase(String date) {
    /// add Lashio to Tachileik List
    FirebaseTicketDataAgent()
        .getLashioToTachileik(date.toString())
        .then((value) {
      lashioToTachileikList.assignAll(value);
    });

    /// add Lashio to Taunggyi List
    FirebaseTicketDataAgent()
        .getLashioToTaunggyi(date.toString())
        .then((value) {
      lashioToTaunggyiList.assignAll(value);
    });

    /// add Tachileik to Lashio List
    FirebaseTicketDataAgent()
        .getTachileikToLashio(date.toString())
        .then((value) {
      tachileikToLashioList.assignAll(value);
    });

    /// add Tachileik to Taunggyi List
    FirebaseTicketDataAgent()
        .getTachileikToTaunggyi(date.toString())
        .then((value) {
      tachileikToTaunggyiList.assignAll(value);
    });

    /// add Taunggyi to Tachileik List
    FirebaseTicketDataAgent()
        .getTaunggyiToTachileik(date.toString())
        .then((value) {
      taunggyiToTachileikList.assignAll(value);
    });

    /// add Taunggyi to Lashio List
    FirebaseTicketDataAgent()
        .getTaunggyiToLashio(date.toString())
        .then((value) {
      taunggyiToLashioList.assignAll(value);
    });
  }

  bool checkExpand(List<TicketVO> list) {
    if (list!.length < 1) {
      return false;
    } else {
      return true;
    }
  }
}
