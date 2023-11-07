import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tkt_ticket/models/vo/ticket.dart';
import 'package:tkt_ticket/network/ticket_data_agent.dart';

import '../resources/strings.dart';

class FirebaseTicketDataAgent extends TicketDataAgent {
  @override
  Future<List<TicketVO>> getLashioToTachileik(String date) async {
    List<TicketVO> ticketsList = [];
    var tickets = await FirebaseFirestore.instance
        .collection("tickets")
        .where('date', isEqualTo: date)
        .where('way', isEqualTo: LashioToTachileik)
        .get();
    for (var ticket in tickets.docs) {
      TicketVO ticketVO = TicketVO.fromJson(ticket.data());
      ticketsList.add(ticketVO);
    }
    return Future.value(ticketsList);
  }

  @override
  Future<List<TicketVO>> getLashioToTaunggyi(String date) async {
    List<TicketVO> ticketsList = [];
    var tickets = await FirebaseFirestore.instance
        .collection("tickets")
        .where('date', isEqualTo: date)
        .where('way', isEqualTo: LashioToTaunggyi)
        .get();
    for (var ticket in tickets.docs) {
      TicketVO ticketVO = TicketVO.fromJson(ticket.data());
      ticketsList.add(ticketVO);
    }
    return Future.value(ticketsList);
  }

  @override
  Future<List<TicketVO>> getTachileikToLashio(String date) async {
    List<TicketVO> ticketsList = [];
    var tickets = await FirebaseFirestore.instance
        .collection("tickets")
        .where('date', isEqualTo: date)
        .where('way', isEqualTo: TachileikToLashio)
        .get();
    for (var ticket in tickets.docs) {
      TicketVO ticketVO = TicketVO.fromJson(ticket.data());
      ticketsList.add(ticketVO);
    }
    return Future.value(ticketsList);
  }

  @override
  Future<List<TicketVO>> getTachileikToTaunggyi(String date) async {
    List<TicketVO> ticketsList = [];
    var tickets = await FirebaseFirestore.instance
        .collection("tickets")
        .where('date', isEqualTo: date)
        .where('way', isEqualTo: TachileikToTaunggyi)
        .get();
    for (var ticket in tickets.docs) {
      TicketVO ticketVO = TicketVO.fromJson(ticket.data());
      ticketsList.add(ticketVO);
    }
    return Future.value(ticketsList);
  }

  @override
  Future<List<TicketVO>> getTaunggyiToLashio(String date) async {
    List<TicketVO> ticketsList = [];
    var tickets = await FirebaseFirestore.instance
        .collection("tickets")
        .where('date', isEqualTo: date)
        .where('way', isEqualTo: TaunggyiToLashio)
        .get();
    for (var ticket in tickets.docs) {
      TicketVO ticketVO = TicketVO.fromJson(ticket.data());
      ticketsList.add(ticketVO);
    }
    return Future.value(ticketsList);
  }

  @override
  Future<List<TicketVO>> getTaunggyiToTachileik(String date) async {
    List<TicketVO> ticketsList = [];
    var tickets = await FirebaseFirestore.instance
        .collection("tickets")
        .where('date', isEqualTo: date)
        .where('way', isEqualTo: TaunggyiToTachileik)
        .get();
    for (var ticket in tickets.docs) {
      TicketVO ticketVO = TicketVO.fromJson(ticket.data());
      ticketsList.add(ticketVO);
    }
    return Future.value(ticketsList);
  }
}
