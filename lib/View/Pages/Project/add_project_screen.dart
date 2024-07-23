import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mr_interior/Constants/app_sizes.dart';
import 'package:mr_interior/Controller/project_controller.dart';

import '../../../Constants/app_colors.dart';
import '../../../Constants/app_defaults.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textfield.dart';

class AddProjectScreen extends GetView<ProjectController> {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Project"),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.DARK_PURPLE,
                  AppColors.LIGHT_PURPLE]),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Obx(() => ListView(
          children: [
            Row(
              children: [
                Radio(
                    value: "Package",
                    groupValue: controller.radio.value,
                    activeColor: AppColors.DARK_PURPLE,
                    onChanged: (value) {
                        controller.onChangedButton(value.toString());
                    },),
                Text("Package",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Radio(
                    value: "Custom",
                    groupValue: controller.radio.value,
                    activeColor: AppColors.DARK_PURPLE,
                    onChanged: (value) {
                      controller.onChangedButton(value.toString());
                    },),
                Text("Custom",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ],
            ),
            AppSizes.hGap12,
            CustomTextFormField(
              label: "Name",
              controller: controller.nameController.value,
              hintText: "Enter Project Name",
            ),
            AppSizes.hGap12,
            CustomTextFormField(
              label: "Description",
              controller: controller.descriptionController.value,
              hintText: "Enter Project Description",
            ),
            controller.radio.value == "Package" ?AppSizes.hGap12  :Container(),
            controller.radio.value == "Package" ? Text(
              "Package",
              style: AppDefaults.textStyleBold16(
                  fontColor: AppColors.DARK_PURPLE),
            ) : Container(),
            controller.radio.value == "Package" ? Container(
              height: 45,
              decoration: BoxDecoration(
                  color: AppColors.LIGHT_PURPLE.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    '-- No Client Select --',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: controller.packagesnameList
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
                  value: controller.packagename.value,
                  onChanged: (value) {
                    controller.packagename.value = value.toString();
                    controller.nameController.value.text = value.toString();
                    print(value.toString());
                    int index = controller.packagesnameList
                        .indexWhere((item) => item == value);
                    controller.packageId.value = controller.packagesList[index - 1].id.toString();
                    controller.packagePrice.value = controller.packagesList[index - 1].price.toString();
                    controller.descriptionController.value.text = controller.packagesList[index - 1].description.toString();
                    // print(controller.countrylist[index].id);
                    // controller.getState();
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
            ) : Container(),
            AppSizes.hGap12,
            Text(
              "Client",
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
                    '-- No Client Select --',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: controller.clientsnameList
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
                  value: controller.clientname.value,
                  onChanged: (value) {
                    controller.clientname.value = value.toString();
                    print(value.toString());
                    int index = controller.clientsnameList
                        .indexWhere((item) => item == value);
                    controller.clientId.value = controller.clientsList[index - 1].id.toString();
                    // print(controller.countrylist[index].id);
                    // controller.getState();
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
              "Designer",
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
                    '-- No Designer Select --',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: controller.designersnameList
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
                  value: controller.designername.value,
                  onChanged: (value) {
                    controller.designername.value = value.toString();
                    print(value.toString());
                    int index = controller.designersnameList
                        .indexWhere((item) => item == value);
                    controller.designerId.value = controller.designersList[index - 1].id.toString();
                    // print(controller.countrylist[index].id);
                    // controller.getState();
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
              "Head Carpenter",
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
                    '-- No Head Carpenter Select --',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: controller.headcarpenternameList
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
                  value: controller.headcarpentername.value,
                  onChanged: (value) {
                    controller.headcarpentername.value = value.toString();
                    print(value.toString());
                    int index = controller.headcarpenternameList
                        .indexWhere((item) => item == value);
                    controller.headcarpenterId.value = controller.headcarpenterList[index - 1].id.toString();
                    // print(controller.countrylist[index].id);
                    // controller.getState();
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
            controller.radio.value == "Package" ? Container() :AppSizes.hGap12,
            controller.radio.value == "Package" ? Container() : CustomTextFormField(
              label: "Total Price",
              controller: controller.totalpriceController.value,
              hintText: "Enter Project Total Price",
              keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
            ),
            AppSizes.hGap12,
            CustomTextFormField(
              label: "Currently Paid",
              controller: controller.paidController.value,
              hintText: "Enter Project Currently Paid",
              keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
            ),
            AppSizes.hGap12,
            Row(
              children: [
                Expanded(
                  child: Text(
                  "Start Date",
                  style: AppDefaults.textStyleBold16(
                      fontColor: AppColors.DARK_PURPLE),
                  ),
                ),
                AppSizes.wGap12,
                Expanded(
                  child: Text(
                  "End Date",
                  style: AppDefaults.textStyleBold16(
                      fontColor: AppColors.DARK_PURPLE),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      controller.startselectDate(context);
                    },
                    child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColors.LIGHT_PURPLE.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            controller.selectedDate.value == null ? Container():Text("${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}",style: TextStyle(color: AppColors.DARK_PURPLE),),
                          ],
                        ),
                      ),
                    ),
                  )),
                AppSizes.wGap12,
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        controller.endselectDate(context);
                        controller.update();
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: AppColors.LIGHT_PURPLE.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              controller.selectedDate2.value == null ? Container():Text("${controller.selectedDate2.value!.day}/${controller.selectedDate2.value!.month}/${controller.selectedDate2.value!.year}",style: TextStyle(color: AppColors.DARK_PURPLE),),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            AppSizes.hGap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Auto-Detect Location",style: AppDefaults.textStyleBold16(fontColor: AppColors.DARK_PURPLE),),
                Switch(
                  value: controller.isSwitched.value,
                  activeColor: AppColors.DARK_PURPLE,
                  onChanged: controller.toggleSwitch,
                ),
              ],
            ),
            AppSizes.hGap12,
            CustomTextFormField(
              label: "Manual Location",
              controller: controller.locationController.value,
              hintText: "Enter Manual Location",
            ),
            AppSizes.hGap30,
            CustomElevatedButton(
                onPressed: () {
                   if(controller.nameController.value.text.isEmpty){
                  Fluttertoast.showToast(
                  msg: "Please Enter Project Name",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0);
                  } else if(controller.radio.value == "Package" && controller.packagename.value == "-- No Package Select --"){
                      Fluttertoast.showToast(
                          msg: "Please Select Package",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if(controller.clientname.value == "-- No Client Select --"){
                      Fluttertoast.showToast(
                          msg: "Please Select Client",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if(controller.selectedDate.value == null){
                      Fluttertoast.showToast(
                          msg: "Please Select Start Date",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if(controller.selectedDate2.value == null){
                      Fluttertoast.showToast(
                          msg: "Please Select End Date",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if(controller.isSwitched.isFalse && controller.locationController.value.text.isEmpty){
                      Fluttertoast.showToast(
                          msg: "Please Enter Manual Address OR ON Auto Location",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black45,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                         controller.createProject();
                    }

                },
                title: "Submit")
          ],
        ),),
      )
    );
  }
}