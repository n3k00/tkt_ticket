import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkt_ticket/controllers/day_tab_bar_controller.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:tkt_ticket/resources/strings.dart';
import 'package:tkt_ticket/widgets/way_section_view.dart';

class DayTabBarView extends StatelessWidget {
  final String date;
  DayTabBarView({required this.date});
  final DayTabBarController dayTabBarController =
      Get.put(DayTabBarController());

  @override
  Widget build(BuildContext context) {
    dayTabBarController.fetchDataFromFirebase(date);
    var size = MediaQuery.of(context).size;
    double itemHeight = GRID_VIEW_ITEM_HEIGHT;
    final double itemWidth = size.width / 2;
    return Padding(
      padding: EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
      child: Obx(() {
        return ListView(
          children: [
            WaySectionView(
              wayList: dayTabBarController.lashioToTachileikList.value,
              title: LashioToTachileik,
            ),
            SizedBox(height: MARGIN_MEDIUM),
            WaySectionView(
              wayList: dayTabBarController.lashioToTaunggyiList.value,
              title: LashioToTaunggyi,
            ),
            SizedBox(height: MARGIN_MEDIUM),
            WaySectionView(
              wayList: dayTabBarController.tachileikToLashioList.value,
              title: TachileikToLashio,
            ),
            SizedBox(height: MARGIN_MEDIUM),
            WaySectionView(
                wayList: dayTabBarController.tachileikToTaunggyiList.value,
                title: TachileikToTaunggyi),
            SizedBox(height: MARGIN_MEDIUM),
            WaySectionView(
                wayList: dayTabBarController.taunggyiToTachileikList.value,
                title: TaunggyiToTachileik),
            SizedBox(height: MARGIN_MEDIUM),
            WaySectionView(
                wayList: dayTabBarController.taunggyiToLashioList.value,
                title: TaunggyiToLashio),
            SizedBox(height: MARGIN_MEDIUM),
          ],
        );
      }),
    );
  }
}
