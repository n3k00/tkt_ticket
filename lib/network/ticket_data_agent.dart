import 'package:tkt_ticket/models/vo/ticket.dart';

abstract class TicketDataAgent {
  Future<List<TicketVO>> getLashioToTachileik(String date);
  Future<List<TicketVO>> getLashioToTaunggyi(String date);
  Future<List<TicketVO>> getTachileikToLashio(String date);
  Future<List<TicketVO>> getTachileikToTaunggyi(String date);
  Future<List<TicketVO>> getTaunggyiToLashio(String date);
  Future<List<TicketVO>> getTaunggyiToTachileik(String date);
}
