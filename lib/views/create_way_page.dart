import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkt_ticket/controllers/create_way_controller.dart';
import 'package:tkt_ticket/resources/constants.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:tkt_ticket/resources/strings.dart';

class CreateWayPage extends StatelessWidget {
  static const String id = "/home_page/create_way_page";

  @override
  Widget build(BuildContext context) {
    final CreateWayController cwController = Get.put(CreateWayController());

    return Scaffold(
      appBar: AppBar(
        title: Text(FILL_PASSENGER_DATA_STRING),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// ခရီးစဥ်
              Container(
                decoration: kDropDownButtonDecoration,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: Obx(() {
                      return DropdownButton(
                        //hint: Text(),
                        isExpanded: true,
                        value: cwController.selectedWay.value,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: cwController.ways.map((value) {
                          return DropdownMenuItem(
                            enabled: 'ခရီးစဥ်' == value ? false : true,
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: 'ခရီးစဥ်' == value
                                      ? Colors.black54
                                      : Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          cwController.changeSelectWay(value.toString());
                        },
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM_3),
              Row(
                children: [
                  /// ထိုင်ခုံ
                  Expanded(
                    child: Container(
                      decoration: kDropDownButtonDecoration,
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: Obx(() {
                            return DropdownButton(
                              isExpanded: true,
                              value: cwController.selectedSet.value,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: cwController.sets.map((value) {
                                return DropdownMenuItem(
                                  enabled: "ထိုင်ခုံ" == value ? false : true,
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: "ထိုင်ခုံ" == value
                                            ? Colors.black54
                                            : Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                cwController.changeSelectSet(value.toString());
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MARGIN_MEDIUM_3),

                  /// ခရီးသည် အရေအတွက်
                  Expanded(
                    child: TextField(
                      controller: cwController.passengerCountController,
                      keyboardType: TextInputType.number,
                      decoration: kInputTextFieldDecorationStyle.copyWith(
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          hintText: "အရေအတွက်"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MARGIN_MEDIUM_3),

              /// ခရီးသည် နာမည်
              TextField(
                controller: cwController.nameController,
                keyboardType: TextInputType.name,
                decoration: kInputTextFieldDecorationStyle.copyWith(
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "နာမည်"),
              ),
              SizedBox(height: MARGIN_MEDIUM_3),

              /// ခရီးသည် ဖုန်းနံပါတ်
              TextField(
                controller: cwController.phoneController,
                keyboardType: TextInputType.phone,
                decoration: kInputTextFieldDecorationStyle.copyWith(
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "ဖုန်းနံပါတ်"),
              ),
              SizedBox(height: MARGIN_MEDIUM_3),

              /// နေ့စွဲ
              TextField(
                controller: cwController.selectDateController,
                decoration: kInputTextFieldDecorationStyle.copyWith(
                    suffixIcon: Icon(Icons.calendar_today),
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "ရက်ရွေးရန်"),
                readOnly: true,
                onTap: () {
                  cwController.selectDate();
                },
              ),
              SizedBox(height: MARGIN_MEDIUM_3),

              /// မှတ်ချက်
              TextField(
                controller: cwController.noteController,
                keyboardType: TextInputType.text,
                maxLines: 4,
                decoration: kInputTextFieldDecorationStyle.copyWith(
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "မှတ်ချက်"),
              ),

              SizedBox(height: MARGIN_MEDIUM_3),

              ElevatedButton(
                onPressed: () {
                  cwController.inputWay();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ထည့်ရန်",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
