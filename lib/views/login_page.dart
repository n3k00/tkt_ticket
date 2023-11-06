import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tkt_ticket/controllers/login_controller.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:tkt_ticket/resources/strings.dart';

import '../resources/constants.dart';

class LoginPage extends StatelessWidget {
  static const String id = "/login_page";
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: Text(LOGIN_PAGE_APP_BAR_TITLE),
        centerTitle: true,
      ),
      body: Obx(() {
        return ModalProgressHUD(
          inAsyncCall: loginController.showSpinner.value,
          child: Padding(
            padding: EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: AssetImage("images/logo.png"),
                  width: LOGIN_LOGO_SIZE,
                  height: LOGIN_LOGO_SIZE,
                ),
                SizedBox(height: MARGIN_XLARGE),
                TextField(
                  controller: loginController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInputTextFieldDecorationStyle.copyWith(
                    hintText: LOGIN_ENTER_EMAIL_ADDRESS,
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: MARGIN_CARD_MEDIUM_2),
                TextField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: kInputTextFieldDecorationStyle.copyWith(
                    hintText: LOGIN_ENTER_PASSWORD,
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                  ),
                  onPressed: () {
                    loginController.login();
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
