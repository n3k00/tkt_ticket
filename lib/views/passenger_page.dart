import 'package:flutter/material.dart';
import 'package:tkt_ticket/models/vo/ticket.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:url_launcher/url_launcher.dart';

class PassengerPage extends StatelessWidget {
  TicketVO ticket;

  PassengerPage({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ခရီးသည်ဧ။် အချက်အလက်များ"),
      ),
      body: Padding(
        padding: EdgeInsets.all(MARGIN_MEDIUM + 2),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FieldSection(
                lable: "နာမည်",
                value: ticket.name,
              ),
              Divider(),
              FieldSection(
                lable: "ဖုန်းနံပါတ်",
                value: ticket.phone,
                isTrailing: true,
              ),
              Divider(),
              FieldSection(
                lable: "ခရီးစဥ်",
                value: ticket.way,
              ),
              Divider(),
              FieldSection(
                lable: "ခုံ",
                value: ticket.set,
              ),
              Divider(),
              FieldSection(
                lable: "ခုံအရေအတွက်",
                value: ticket.setNumber,
              ),
              Divider(),
              FieldSection(
                lable: "လိုက်မည့်ရက်",
                value: ticket.date,
              ),
              Divider(),
              FieldSection(
                lable: "မှတ်ချက်",
                value: ticket.note,
              ),
              Divider(),
              FieldSection(
                lable: "လက်မှတ်ဖြတ်ပေးသူ",
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
  String lable;
  String value;
  bool isTrailing;
  FieldSection(
      {required this.lable, required this.value, this.isTrailing = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: MediaQuery.of(context).size.width / 4, child: Text(lable)),
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
