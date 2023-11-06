import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkt_ticket/controllers/home_controller.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:tkt_ticket/resources/strings.dart';
import 'package:tkt_ticket/views/create_way_page.dart';
import 'package:tkt_ticket/widgets/tab_bar_view.dart';
import 'package:tkt_ticket/widgets/way_section_view.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(HOME_PAGE_APP_BAR_TITLE),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.logout_outlined,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
          ),
        ],
        bottom: TabBar(
          controller: homeController.tabController,
          physics: BouncingScrollPhysics(),
          isScrollable: true,
          tabs: homeController.dates.map((date) {
            return Tab(
              height: HOME_SCREEN_TAB_HEIGHT,
              child: Container(
                width: HOME_SCREEN_TAB_WIDTH,
                child: Column(
                  children: [
                    Text(homeController.convertWeekday(date.weekday)),
                    Text(date.day.toString()),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        physics: BouncingScrollPhysics(),
        controller: homeController.tabController,
        children: homeController.dates.map((date) {
          return Center(
            child: DayTabBarView(),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(CreateWayPage.id);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
