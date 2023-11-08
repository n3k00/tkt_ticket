import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkt_ticket/models/vo/ticket.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:tkt_ticket/views/passenger_page.dart';

class WaySectionView extends StatelessWidget {
  final List<TicketVO>? wayList;
  final String title;

  WaySectionView({
    required this.wayList,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemHeight = GRID_VIEW_ITEM_HEIGHT;
    final double itemWidth = size.width / 2;
    return wayList == null
        ? Center(child: CircularProgressIndicator())
        : Card(
            child: ExpansionTile(
              initiallyExpanded: true,
              trailing: wayList!.length < 1
                  ? Icon(
                      Icons.keyboard_arrow_down_outlined,
                    )
                  : Icon(
                      Icons.keyboard_arrow_up_outlined,
                    ),
              title: Text(
                title,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X + 2,
                    fontWeight: FontWeight.bold,
                    color: wayList!.length < 1 ? Colors.black : Colors.green),
              ),
              subtitle: Text(
                "ခရီးသည် စုစုပေါင်း : ${wayList!.length}",
                style: TextStyle(
                  color: wayList!.length < 1 ? Colors.black : Colors.green,
                ),
              ),
              children: [
                GridView.count(
                  physics: ScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: itemWidth / itemHeight,
                  scrollDirection: Axis.vertical,
                  children: wayList!.map(
                    (ticket) {
                      return Padding(
                        padding: const EdgeInsets.all(MARGIN_SMALL),
                        child: Card(
                          elevation: 5,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => PassengerPage(ticket: ticket));
                            },
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: MARGIN_MEDIUM_2),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(ticket.set),
                                        Text(ticket.setNumber)
                                      ],
                                    ),
                                    Text(ticket.name),
                                    Spacer(),
                                    Text(
                                      "By ${ticket.agent}",
                                      style: TextStyle(
                                        fontSize: TEXT_SMALL,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //subtitle: Text("By ${ticket.agent}"),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          );
  }
}
