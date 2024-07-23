import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:mr_interior/Model/project_model.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Constants/app_strings.dart';
import '../Model/clients_model.dart';
import '../Model/package_model.dart';

class ProjectController extends GetxController with WidgetsBindingObserver {

  RxString radio = "Package".obs;
  var isLoading = true.obs;
  RxList<Clients> clientsList = <Clients>[].obs;
  RxList<Clients> designersList = <Clients>[].obs;
  RxList<Clients> headcarpenterList = <Clients>[].obs;
  RxList<Projects> projectList = <Projects>[].obs;
  RxList<String> clientsnameList = ["-- No Client Select --"].obs;
  RxString clientname = "-- No Client Select --".obs;
  RxString clientId = "".obs;
  RxList<String> designersnameList = ["-- No Designer Select --"].obs;
  RxString designername = "-- No Designer Select --".obs;
  RxString designerId = "".obs;
  RxList<String> headcarpenternameList = ["-- No Head Carpenter Select --"].obs;
  RxString headcarpentername = "-- No Head Carpenter Select --".obs;
  RxString headcarpenterId = "".obs;
  RxList<Packages> packagesList = <Packages>[].obs;
  RxList<String> packagesnameList = ["-- No Package Select --"].obs;
  RxString packagename = "-- No Package Select --".obs;
  RxString packageId = "".obs;
  RxString packagePrice = "".obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<TextEditingController> totalpriceController = TextEditingController().obs;
  Rx<TextEditingController> paidController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<DateTime?> selectedDate2 = Rx<DateTime?>(null);
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  var isSwitched = false.obs;
  RxBool hasLocationPermission = false.obs;


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getClients();
    getPackages();
    GetProjects();
  }

   checkCameraPermission() async {
    final status = await Permission.location.status;

    if (await Permission.location.isGranted) {
      hasLocationPermission.value = true;
      update(); // only needed if you're using GetBuilder widget
      return; // ending the function here because that's all you need.
    }

    if (status.isDenied) {
      await Permission.location.request().then((value) {
         if(value.isGranted){
           isSwitched.value = true;
         }
      });
    }
    // ...continue to handle all the possible outcomes
    update();
  }

  void toggleSwitch(bool value) {
    checkCameraPermission();
    isSwitched.value = hasLocationPermission.value == true ? value : false;
  }

  void onChangedButton(String value) async {
    radio.value = value.toString();
    update();
  }

  void getClients() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}users'));

      if (response.statusCode == 200) {
        List<Clients> tempList = [];
        tempList = clientsFromJson(response.body);
        // clientname.value = clientsList.first.name;
        // clientId.value = clientsList.first.id.toString();
        for( int i = 0; i < tempList.length; i++){
          if(tempList[i].role == "Client"){
            clientsnameList.add(tempList[i].name);
            clientsList.add(tempList[i]);
          } else if(tempList[i].role == "Designer"){
            designersnameList.add(tempList[i].name);
            designersList.add(tempList[i]);
          } else if(tempList[i].role == "Head Carpenter"){
            headcarpenternameList.add(tempList[i].name);
            headcarpenterList.add(tempList[i]);
          }
        }
        print(clientsList.length);
        print(clientsnameList.length);
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  void getPackages() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}packages'));

      if (response.statusCode == 200) {
        packagesList.value = packagesFromJson(response.body);
        // packagename.value = packagesList.first.name;
        // packageId.value = packagesList.first.id.toString();
        for( int i = 0; i < packagesList.length; i++){
          packagesnameList.add(packagesList[i].name);
        }
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

   startselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      update();
    }
    update();
  }

   endselectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate2.value) {
      selectedDate2.value = picked;
      update();
    }
    update();
  }

  void GetProjects() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}projects'));

      if (response.statusCode == 200) {
        projectList.value = projectsFromJson(response.body);
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }

  }

  void GetProjectsId(id) async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}projects/$id'));

      if (response.statusCode == 200) {
        projectList.value = projectsFromJson(response.body);
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }

  }


  void AssignDesignerAPI(id,designer_id) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('PATCH', Uri.parse('${AppStrings().BASE_URL}projects/$id/assign-designer'));
    request.body = json.encode({
      "designer_id": "$designer_id"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     GetProjects();
     Get.back();
    }
    else {
      print(response.reasonPhrase);
    }
  }
  void AssignDCarpenterAPI(id,designer_id) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('PATCH', Uri.parse('${AppStrings().BASE_URL}projects/$id/assign-head-carpenter'));
    request.body = json.encode({
      "head_carpenter_id": "$designer_id"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     GetProjects();
     Get.back();
    }
    else {
      print(response.reasonPhrase);
    }
  }


  createProject() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${AppStrings().BASE_URL}projects'));
    request.body = radio.value == "Package" ?  designerId.value.toString() == "" && headcarpenterId.value.toString() == "" ? json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "client_id": clientId.value.toString(),
      "packageId": radio.value == "Package" ? packageId.value.toString(): ""
    }) : designerId.value.toString() == "" ? json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "client_id": clientId.value.toString(),
      "head_carpenter_id": headcarpenterId.value.toString(),
      "packageId": radio.value == "Package" ? packageId.value.toString(): ""
    }) : headcarpenterId.value.toString() == "" ?   json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "designer_id": designerId.value.toString(),
      "client_id": clientId.value.toString(),
      "packageId": radio.value == "Package" ? packageId.value.toString(): ""
    }):  json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "designer_id": designerId.value.toString(),
      "client_id": clientId.value.toString(),
      "head_carpenter_id": headcarpenterId.value.toString(),
      "packageId": radio.value == "Package" ? packageId.value.toString(): ""
    }) : designerId.value.toString() == "" && headcarpenterId.value.toString() == "" ? json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "client_id": clientId.value.toString(),
    }) : designerId.value.toString() == "" ? json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "client_id": clientId.value.toString(),
      "head_carpenter_id": headcarpenterId.value.toString(),
    }) : headcarpenterId.value.toString() == "" ?   json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "designer_id": designerId.value.toString(),
      "client_id": clientId.value.toString(),
    }):json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "designer_id": designerId.value.toString(),
      "client_id": clientId.value.toString(),
      "head_carpenter_id": headcarpenterId.value.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      ClearData();
      Get.back(result: true);
    }
    else {
      print(response.reasonPhrase);
    }

  }

  updateProject() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse('${AppStrings().BASE_URL}projects'));
    request.body = radio.value == "Package" ? json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "designer_id": designerId.value.toString(),
      "client_id": clientId.value.toString(),
      "head_carpenter_id": headcarpenterId.value.toString(),
      "packageId": radio.value == "Package" ? packageId.value.toString(): ""
    }) : json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "start_date": "${selectedDate.value!.year}-${selectedDate.value!.month}-${selectedDate.value!.day}",
      "end_date": "${selectedDate2.value!.year}-${selectedDate2.value!.month}-${selectedDate2.value!.day}",
      "total_amount": radio.value == "Package" ? packagePrice.value.toString() : totalpriceController.value.text.toString(),
      "currently_paid_amount": paidController.value.text.toString(),
      "left_amount": radio.value == "Package" ? (double.parse(packagePrice.value.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2) : (double.parse(totalpriceController.value.text.toString()) - double.parse(paidController.value.text.toString())).toStringAsFixed(2),
      "location_manual": locationController.value.text.toString(),
      "designer_id": designerId.value.toString(),
      "client_id": clientId.value.toString(),
      "head_carpenter_id": headcarpenterId.value.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      ClearData();
      Get.back(result: true);
    }
    else {
      print(response.reasonPhrase);
    }

  }

  DeleteProject(id) async {
    var request = http.Request('DELETE', Uri.parse('${AppStrings().BASE_URL}projects/$id'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      GetProjects();
      update();
    }
    else {
      print(response.reasonPhrase);
    }

  }

  ClearData(){
     nameController.value.clear();
     descriptionController.value.clear();
     totalpriceController.value.clear();
     paidController.value.clear();
     locationController.value.clear();
     radio.value = "Package";
     clientId.value = "";
     packageId.value = "";
     designerId.value = "";
     headcarpenterId.value = "";
     clientname.value = "-- No Client Select --";
     designername.value = "-- No Designer Select --";
     headcarpentername.value = "-- No Head Carpenter Select --";
     packagename.value = "-- No Package Select --";
     isSwitched.value = false;
     selectedDate2.value = null;
     selectedDate.value = null;
  }


}