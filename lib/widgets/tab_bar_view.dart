import 'package:flutter/material.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:tkt_ticket/resources/strings.dart';
import 'package:tkt_ticket/widgets/way_section_view.dart';

class DayTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
      child: 1 == 1
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
/*          WaySectionView(
              wayList: lashioToTachileikList, title: LashioToTachileik),
          SizedBox(height: MARGIN_MEDIUM),
          WaySectionView(
              wayList: lashioToTaunggyiList, title: LashioToTaunggyi),
          SizedBox(height: MARGIN_MEDIUM),
          WaySectionView(
              wayList: tachileikToLashioList, title: TachileikToLashio),
          SizedBox(height: MARGIN_MEDIUM),
          WaySectionView(
              wayList: tachileikToTaunggyiList, title: TachileikToTaunggyi),
          SizedBox(height: MARGIN_MEDIUM),
          WaySectionView(
              wayList: taunggyiToTachileikList, title: TaunggyiToTachileik),
          SizedBox(height: MARGIN_MEDIUM),
          WaySectionView(
              wayList: taunggyiToLashioList, title: TaunggyiToLashio),*/
                SizedBox(height: MARGIN_MEDIUM),
              ],
            ),
    );
    ;
  }
}
