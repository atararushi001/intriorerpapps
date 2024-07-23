import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mr_interior/Constants/app_sizes.dart';
import 'package:mr_interior/View/Widgets/custom_button.dart';
import 'package:mr_interior/View/Widgets/custom_textfield.dart';
import '../../../Constants/app_colors.dart';
import '../../../Constants/app_defaults.dart';
import '../../../Controller/designer_controller.dart';

class AddDesignerScreen extends GetView<DesignerController> {
  AddDesignerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Designer"),
          centerTitle: true,
          foregroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.DARK_PURPLE, AppColors.LIGHT_PURPLE]),
            ),
          ),
        ),
        body: Obx(
              () => Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                controller.image.value == null ? GestureDetector(
                  onTap: () {
                    controller.pickImage().then((_) {
                      controller.update();
                    });
                  },
                  child: CircleAvatar(
                    radius: 60,
                  ),
                ) :GestureDetector(
                  onTap: () {
                    controller.pickImage().then((_) {
                      controller.update();
                    });
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(File(controller.image.value!.path)),
                  ),
                ),
                CustomTextFormField(
                  label: "Name",
                  controller: controller.nameController.value,
                  hintText: "Enter Designer Name",
                ),
                AppSizes.hGap12,
                CustomTextFormField(
                  label: "Email",
                  controller: controller.emailController.value,
                  hintText: "Enter Designer Email",
                ),
                AppSizes.hGap12,
                CustomTextFormField(
                  label: "Phone Number",
                  controller: controller.phoneController.value,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  hintText: "Enter Designer Phone Number",
                ),
                AppSizes.hGap12,
                CustomTextFormField(
                  label: "Address",
                  controller: controller.addressController.value,
                  hintText: "Enter Designer Address",
                ),
                AppSizes.hGap12,
                Text(
                  "Country",
                  style: AppDefaults.textStyleBold16(
                      fontColor: AppColors.DARK_PURPLE),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.LIGHT_PURPLE.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        '-- No Country Select --',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: controller.countryList
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.DARK_PURPLE),
                        ),
                      ))
                          .toList(),
                      value: controller.country.value,
                      onChanged: (value) {
                        controller.country.value = value.toString();
                        print(value.toString());
                        int index = controller.countryList
                            .indexWhere((item) => item == value);
                        controller.countryId.value = controller.countrylist[index - 1].id;
                        print(controller.countrylist[index].id);
                        controller.stateList.clear();
                        controller.stateList.add("-- No State Select --");
                        controller.state.value = "-- No State Select --";
                        controller.getState();
                        controller.cityList.clear();
                        controller.cityList.add("-- No City Select --");
                        controller.city.value = "-- No City Select --";
                        controller.update();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
                AppSizes.hGap12,
                Text(
                  "State",
                  style: AppDefaults.textStyleBold16(
                      fontColor: AppColors.DARK_PURPLE),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.LIGHT_PURPLE.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        '-- No State Select --',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.DARK_PURPLE,
                        ),
                      ),
                      items: controller.stateList
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.DARK_PURPLE),
                        ),
                      ))
                          .toList(),
                      value: controller.state.value,
                      onChanged: (value) {
                        controller.state.value = value.toString();
                        int index = controller.stateList
                            .indexWhere((item) => item == value);
                        controller.stateId.value =
                            controller.statelist[index - 1].id;
                        controller.cityList.clear();
                        controller.cityList.add("-- No City Select --");
                        controller.city.value = "-- No City Select --";
                        controller.getCity();
                        controller.update();

                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
                AppSizes.hGap12,
                Text(
                  "City",
                  style: AppDefaults.textStyleBold16(
                      fontColor: AppColors.DARK_PURPLE),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.LIGHT_PURPLE.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        '-- No City Select --',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.DARK_PURPLE,
                        ),
                      ),
                      items: controller.cityList
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.DARK_PURPLE),
                        ),
                      ))
                          .toList(),
                      value: controller.city.value,
                      onChanged: (value) {
                        controller.city.value = value.toString();
                        int index = controller.cityList
                            .indexWhere((item) => item == value);
                        controller.cityId.value =
                            controller.citylist[index].id;
                        controller.update();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
                AppSizes.hGap12,
                CustomTextFormField(
                  label: "Password",
                  controller: controller.passwordController.value,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  hintText: "Enter Designer Password",
                ),
                AppSizes.hGap30,
                CustomElevatedButton(
                    onPressed: () {
                      if (controller.nameController.value.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Designer Name",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (controller
                          .emailController.value.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Designer Email Id",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controller.emailController.value.text)) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Correct Designer Email Id",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (controller
                          .phoneController.value.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Designer Phone",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (controller
                          .addressController.value.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Designer Address",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (controller
                          .passwordController.value.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Designer Password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (controller.image.value == null) {
                        Fluttertoast.showToast(
                            msg: "Please Select Designer Image",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        controller.createDesigner();
                      }
                    },
                    title: "Submit")
              ],
            ),
          ),
        ));
  }
}
