import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkt_ticket/controllers/passenger_controller.dart';
import 'package:tkt_ticket/models/vo/ticket.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:url_launcher/url_launcher.dart';

class PassengerPage extends StatelessWidget {
  final TicketVO ticket;

  PassengerPage({required this.ticket});

  final PassengerController passengerController =
      Get.put(PassengerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ခရီးသည်ဧ။် အချက်အလက်များ"),
        actions: [
          /*IconButton(
            onPressed: () {
              passengerController.deletePassenger(ticket.timestamp);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),*/
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(MARGIN_MEDIUM + 2),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FieldSection(
                label: "နာမည်",
                value: ticket.name,
              ),
              Divider(),
              FieldSection(
                label: "ဖုန်းနံပါတ်",
                value: ticket.phone,
                isTrailing: true,
              ),
              Divider(),
              FieldSection(
                label: "ခရီးစဥ်",
                value: ticket.way,
              ),
              Divider(),
              FieldSection(
                label: "ခုံ",
                value: ticket.set,
              ),
              Divider(),
              FieldSection(
                label: "ခုံအရေအတွက်",
                value: ticket.setNumber,
              ),
              Divider(),
              FieldSection(
                label: "လိုက်မည့်ရက်",
                value: ticket.date,
              ),
              Divider(),
              FieldSection(
                label: "မှတ်ချက်",
                value: ticket.note,
              ),
              Divider(),
              FieldSection(
                label: "လက်မှတ်ဖြတ်သူ",
                value: ticket.agent,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("ပြန်ထွက်ရန်"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FieldSection extends StatelessWidget {
  String label;
  String value;
  bool isTrailing;
  FieldSection({
    required this.label,
    required this.value,
    this.isTrailing = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: MediaQuery.of(context).size.width / 3.7,
        child: Text(label),
      ),
      title: Text(value),
      trailing: isTrailing
          ? IconButton(
              onPressed: () async {
                print("Hello");
                final call = Uri.parse('tel:$value');
                await launchUrl(call);
              },
              icon: Icon(Icons.phone))
          : null,
    );
  }
}
