import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkt_ticket/views/create_way_page.dart';
import 'package:tkt_ticket/views/home_page.dart';
import 'package:tkt_ticket/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TKT Ticket',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        //useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      initialRoute: LoginPage.id,
      getPages: [
        GetPage(name: HomePage.id, page: () => HomePage()),
        GetPage(name: LoginPage.id, page: () => LoginPage()),
        GetPage(name: CreateWayPage.id, page: () => CreateWayPage()),
      ],
    );
  }
}
