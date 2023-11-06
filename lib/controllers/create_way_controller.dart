import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateWayController extends GetxController {
  var selectedWay = 'ခရီးစဥ်'.obs;
  var selectedSet = 'ထိုင်ခုံ'.obs;
  TextEditingController? passengerCountController;
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? selectDateController;
  TextEditingController? noteController;
  List<String> sets = ["ထိုင်ခုံ", "ရှေ့ခန်း", "နောက်ခန်း"];
  List<String> ways = [
    'ခရီးစဥ်',
    'လားရှိုး -> တာချီလိတ်',
    'လားရှိုး -> တောင်ကြီး',
    'တာချီလိတ် -> လားရှိုး',
    'တာချီလိတ် -> တောင်ကြီး',
    'တောင်ကြီး -> တာချီလိတ်',
    'တောင်ကြီး -> လားရှိုး',
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    /// initialized TextField Controller
    passengerCountController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    selectDateController = TextEditingController();
    selectDateController?.text = "";
    noteController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    /// Close TextField Controller
    passengerCountController?.dispose();
    phoneController?.dispose();
    nameController?.dispose();
    selectDateController?.dispose();
    noteController?.dispose();
    super.onClose();
  }

  /// change  ခရီးစဥ်
  void changeSelectWay(String value) {
    selectedWay.value = value;
  }

  /// change ထိုင်ခုံ
  void changeSelectSet(String value) {
    selectedSet.value = value;
    if (value == "ရှေ့ခန်း") {
      passengerCountController?.text = 1.toString();
    }
  }

  /// select Date
  selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // - not to allow to choose before today.
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(formattedDate);
      selectDateController?.text = formattedDate;
    } else {
      print("Date is not selected");
    }
  }
}
