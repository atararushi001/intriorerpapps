import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mr_interior/Constants/app_strings.dart';
import 'package:mr_interior/RoutesManagment/routes.dart';
import 'package:mr_interior/View/Widgets/custom_textfield.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../main.dart';
import '../DashBoard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  TextEditingController ipaddress = TextEditingController();
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPermission();
    checkCameraPermission();
  }

  checkCameraPermission() async {
    final status = await Permission.location.status;

    if (await Permission.location.isGranted) {
      // hasLocationPermission.value = true;
      // update(); // only needed if you're using GetBuilder widget
      return; // ending the function here because that's all you need.
    }

    if (status.isDenied) {
      await Permission.location.request().whenComplete(() {
        if(status.isGranted){
          // isSwitched.value = true;
        }
      });
    }
    // ...continue to handle all the possible outcomes
    // update();
  }

  GetPermission() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      Timer(const Duration(seconds: 3), (){
        Get.offAllNamed(RouteConstants.dashboardScreen);
      });
    } else {
      print('No internet :( Reason:');
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Oops No Internet Connection"),
              content: Text(
                "Please Turn On your Internet Connection"
              ),
            );
          },);
      // GetPermission();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CustomTextFormField(
            //   label: "Your IP Address",
            //   controller: ipaddress,
            //   onChanged: (value){
            //     setState(() {
            //       IPAddress = value.toString();
            //     });
            //   },
            //   hintText: "Enter Your IP Address",
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // ElevatedButton(onPressed: () {
            //   Get.offAllNamed(RouteConstants.dashboardScreen);
            // },
            //     child: Text("Next")),
            // SizedBox(
            //   height: 20,
            // ),
            Text("Welcome To Application", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
