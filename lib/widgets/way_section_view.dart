import 'package:flutter/material.dart';
import 'package:tkt_ticket/resources/dimens.dart';

class WaySectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemHeight = GRID_VIEW_ITEM_HEIGHT;
    final double itemWidth = size.width / 2;
    List? wayList;
    String title;
    return Center(
      child: Text("hello"),
    );
    /* return Card(
        child: ExpansionTile(
      initiallyExpanded: wayList!.length < 1 ? false : true,
      title: Text(
        "Title",
        style: TextStyle(
          fontSize: TEXT_REGULAR_2X + 2,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("ခရီးသည် စုစုပေါင်း : ${wayList!.length}"),
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
                    onTap: () {},
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM_2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    ));*/
  }
}
