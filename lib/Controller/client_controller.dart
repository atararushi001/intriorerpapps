import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_interior/Model/city_model.dart';
import '../Constants/app_strings.dart';
import '../Model/clients_model.dart';
import '../Model/country_model.dart';
import '../Model/state_model.dart';

class ClientController extends GetxController with WidgetsBindingObserver {
  var isLoading = true.obs;
  RxList<Clients> clientsList = <Clients>[].obs;
  RxList<String> countryList = <String>[].obs;
  RxList<String> stateList = <String>[].obs;
  RxList<CountryList> countrylist = <CountryList>[].obs;
  RxList<StateList> statelist = <StateList>[].obs;
  RxList<String> cityList = <String>[].obs;
  RxList<CityList> citylist = <CityList>[].obs;
  Rx<String> country = "-- No Country Select --".obs;
  Rx<int> countryId = 0.obs;
  Rx<String> state = "-- No State Select --".obs;
  Rx<int> stateId = 0.obs;
  Rx<String> city = "-- No City Select --".obs;
  Rx<int> cityId = 0.obs;
  RxBool isUpdate = false.obs;
  Rx<File?> image = Rx<File?>(null);
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmpasswordController =
      TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getClients();
    getCountry();
    getState();
    getCity();
    country.value = "-- No Country Select --";
    state.value = "-- No State Select --";
    city.value = "-- No City Select --";
    stateList.add("-- No State Select --");
    cityList.add("-- No City Select --");
  }

  pickImage() async {
    try {
      final images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images != null) {
        image.value = File(images.path);
        print(image.value!.path);
        update();
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void getClients() async {
    clientsList.clear();
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}users'));

      if (response.statusCode == 200) {
        List<Clients> tempclientlist = clientsFromJson(response.body);
        for(int i = 0 ; i < tempclientlist.length; i++){
          if(tempclientlist[i].role == "Client"){
            clientsList.add(tempclientlist[i]);
          }
        }
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> createUser() async {
    try {
      var url = Uri.parse('${AppStrings().BASE_URL}users');

      var fields = {
        'name': nameController.value.text,
        'email': emailController.value.text,
        'phone': phoneController.value.text,
        'address': addressController.value.text,
        'password': passwordController.value.text,
        'role': 'Client',
        'cityId': cityId.value.toString(),
      };

      var request = http.MultipartRequest('POST', url);
      request.fields.addAll(fields);

      var multipartFile =
      await http.MultipartFile.fromPath('profilePicture', image.value!.path.toString(), contentType: MediaType("image","jpeg"));
      request.files.add(multipartFile);

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();


      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(responseBody);
        ClearData();
        Get.back(result: true);
        // Handle successful response
        print(jsonResponse);
      } else {
        // Handle error
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception occurred: $e');
    }
    // try {
    //   var url = Uri.parse('${AppStrings().BASE_URL}users');
    //
    //   var fields = {
    //     'name': nameController.value.text,
    //     'email': emailController.value.text,
    //     'phone': phoneController.value.text,
    //     'address': addressController.value.text,
    //     'password': passwordController.value.text,
    //     'role': 'Client',
    //     'cityId': cityId.value.toString(),
    //   };
    //
    //   var request = http.MultipartRequest('POST', url);
    //   request.fields.addAll(fields);
    //
    //   var multipartFile =
    //       await http.MultipartFile.fromPath('profilePicture', image!.path);
    //   request.files.add(multipartFile);
    //
    //   var response = await request.send();
    //   var responseBody = await response.stream.bytesToString();
    //
    //   log(responseBody);
    //   log(request.fields.toString());
    //   log(request.files.length.toString());
    //   log(request.files.last.filename.toString());
    //
    //   if (response.statusCode == 201) {
    //     var jsonResponse = jsonDecode(responseBody);
    //     Get.back(result: true);
    //     // Handle successful response
    //     print(jsonResponse);
    //   } else {
    //     // Handle error
    //     print('Error: ${response.reasonPhrase}');
    //   }
    // } catch (e) {
    //   // Handle any exceptions
    //   print('Exception occurred: $e');
    // }
  }
  Future<void> updateUser() async {
    try {
      var url = Uri.parse('${AppStrings().BASE_URL}users');

      var fields = {
        'name': nameController.value.text,
        'email': emailController.value.text,
        'phone': phoneController.value.text,
        'address': addressController.value.text,
        'password': passwordController.value.text,
        'role': 'Client',
        'cityId': cityId.value.toString(),
      };

      var request = http.MultipartRequest('PUT', url);
      request.fields.addAll(fields);

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();


      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(responseBody);
        ClearData();
        Get.back(result: true);
        // Handle successful response
        print(jsonResponse);
      } else {
        // Handle error
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception occurred: $e');
    }
    // try {
    //   var url = Uri.parse('${AppStrings().BASE_URL}users');
    //
    //   var fields = {
    //     'name': nameController.value.text,
    //     'email': emailController.value.text,
    //     'phone': phoneController.value.text,
    //     'address': addressController.value.text,
    //     'password': passwordController.value.text,
    //     'role': 'Client',
    //     'cityId': cityId.value.toString(),
    //   };
    //
    //   var request = http.MultipartRequest('POST', url);
    //   request.fields.addAll(fields);
    //
    //   var multipartFile =
    //       await http.MultipartFile.fromPath('profilePicture', image!.path);
    //   request.files.add(multipartFile);
    //
    //   var response = await request.send();
    //   var responseBody = await response.stream.bytesToString();
    //
    //   log(responseBody);
    //   log(request.fields.toString());
    //   log(request.files.length.toString());
    //   log(request.files.last.filename.toString());
    //
    //   if (response.statusCode == 201) {
    //     var jsonResponse = jsonDecode(responseBody);
    //     Get.back(result: true);
    //     // Handle successful response
    //     print(jsonResponse);
    //   } else {
    //     // Handle error
    //     print('Error: ${response.reasonPhrase}');
    //   }
    // } catch (e) {
    //   // Handle any exceptions
    //   print('Exception occurred: $e');
    // }
  }

  void getCountry() async {
    isLoading(true);
    try {
      var response = await http.get(
          Uri.parse('${AppStrings().BASE_URL}geographic-entities/countries'));

      if (response.statusCode == 200) {
        CountryModel countryModel;
        countryModel = CountryModel.fromJson(jsonDecode(response.body));
        countryList.clear();
        countrylist.value = countryModel.countries;
        // country.value = countrylist.first.name;
        // countryId.value = countrylist.first.id;
        countryList.add("-- No Country Select --");
        for (var data in countrylist) {
          countryList.add(data.name);
        }
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  void getState() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse(
          '${AppStrings().BASE_URL}geographic-entities/countries/states/${countryId.value}'));

      print(
          '${AppStrings().BASE_URL}geographic-entities/countries/states/${countryId.value}');

      if (response.statusCode == 200) {
        StateModel stateModel;
        stateModel = StateModel.fromJson(jsonDecode(response.body));
        stateList.clear();
        statelist.value = stateModel.states;
        // state.value = "-- No State Select --";
        // stateId.value = 0;
        stateList.add("-- No State Select --");
        for (var data in statelist) {
          stateList.add(data.name);
        }
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  void getCity() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse(
          '${AppStrings().BASE_URL}geographic-entities/countries/state/cities/${stateId.value}'));

      print(response.body);

      if (response.statusCode == 200) {
        CityModel cityModel;
        cityModel = CityModel.fromJson(jsonDecode(response.body));
        cityList.clear();
        citylist.value = cityModel.cities;
        // city.value = citylist.first.name;
        // cityId.value = citylist.first.id;
        cityList.add("-- No City Select --");
        for (var data in citylist) {
          cityList.add(data.name);
        }
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  void DeleteClient(id) async {
    try {
      var response =
          await http.delete(Uri.parse('${AppStrings().BASE_URL}users/$id'));

      if (response.statusCode == 200) {
        getClients();
        Fluttertoast.showToast(
            msg: "Delete Client Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      // object
    } catch (e) {
      print(e);
    }
  }

  void getClientData(id) async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}users/$id'));

      if (response.statusCode == 200) {
        Clients client = Clients.fromJson(jsonDecode(response.body));
        nameController.value.text = client.name.toString();
        emailController.value.text = client.email.toString();
        phoneController.value.text = client.phone.toString();
        addressController.value.text = client.address.toString();
        getCountry();
        countryId.value = client.city.state.countryId;
        country.value =  client.city.state.country.name;
        getState();
        stateId.value = client.city.stateId;
        state.value =  client.city.state.name;
        print("State Name : ${state.value}");
        getCity();
        city.value =  client.city.name;
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  ClearData(){
    nameController.value.clear();
    emailController.value.clear();
    phoneController.value.clear();
    addressController.value.clear();
    passwordController.value.clear();
    image.value = null;
    city.value = "-- No City Select --";
    state.value = "-- No State Select --";
    country.value = "-- No Country Select --";
    cityId.value = 0;
    stateId.value = 0;
    countryId.value = 0;
    update();
  }

}
