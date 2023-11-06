import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkt_ticket/resources/dimens.dart';
import 'package:tkt_ticket/views/home_page.dart';
import 'package:tkt_ticket/widgets/login_fail_dialog.dart';

class LoginController extends GetxController {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  final _auth = FirebaseAuth.instance;
  var showSpinner = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    emailController!.dispose();
    passwordController!.dispose();
    super.onClose();
  }

  void login() async {
    showSpinner(true);
    if (emailController!.text == '' || passwordController!.text == '') {
      Get.dialog(LoginFailDialog(
        text: 'Enter email and password!',
      ));
      showSpinner(false);
    } else {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController!.text,
          password: passwordController!.text,
        );
        if (credential.user != null) {
          Get.offNamedUntil(HomePage.id, (route) => false);
          showSpinner(false);
        }
      } on FirebaseAuthException catch (e) {
        print("Error");
        Get.dialog(LoginFailDialog(text: '"Email and password is incorrect"'));
        /*if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar("No User Found", "Please Login Again!");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Wrong Password", "Please Login Again!");
        print('Wrong password provided for that user.');
      }*/
        showSpinner(false);
      }
    }
  }
}
