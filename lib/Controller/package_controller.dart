import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Constants/app_strings.dart';
import '../Model/package_model.dart';

class PackageController extends GetxController with WidgetsBindingObserver {

  var isLoading = true.obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<TextEditingController> priceController = TextEditingController().obs;
  RxList<Packages> packagesList = <Packages>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPackages();
  }

  void getPackages() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}packages'));

      if (response.statusCode == 200) {
        packagesList.value = packagesFromJson(response.body);
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  void getPackagesbyId(id) async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}packages/$id'));

      if (response.statusCode == 200) {
        nameController.value.text = jsonDecode(response.body)["name"].toString();
        descriptionController.value.text = jsonDecode(response.body)["description"].toString();
        priceController.value.text = jsonDecode(response.body)["price"].toString();
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  void addPackage() async {

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${AppStrings().BASE_URL}packages'));
    request.body = json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "price": double.parse(priceController.value.text.toString()).toStringAsFixed(2)
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      Get.back(result: true);
    }
    else {
      print(response.reasonPhrase);
    }

  }

  void deletePackage(id) async {
    var request = http.Request('DELETE', Uri.parse('${AppStrings().BASE_URL}packages/$id'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      getPackages();
      update();
    }
    else {
      print(response.reasonPhrase);
    }

  }

  void updatePackage(id) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse('${AppStrings().BASE_URL}packages/$id'));
    request.body = json.encode({
      "name": nameController.value.text.toString(),
      "description": descriptionController.value.text.toString(),
      "price": priceController.value.text.toString()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.back(result: true);
    }
    else {
      print(response.reasonPhrase);
    }

  }

  ClearData(){
    nameController.value.clear();
    descriptionController.value.clear();
    priceController.value.clear();
    update();
  }

}