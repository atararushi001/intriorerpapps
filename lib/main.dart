import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_interior/RoutesManagment/routes.dart';

import 'RoutesManagment/pages.dart';
import 'RoutesManagment/screen_bindings.dart';
import 'View/Pages/Splash/splash_screen.dart';

String IPAddress = "";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteConstants.splashScreen,
      getPages: AllPages.getPages(),
      initialBinding: ScreenBindings(),
    );
  }
}