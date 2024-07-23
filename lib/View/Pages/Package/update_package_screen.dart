import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mr_interior/Controller/package_controller.dart';

import '../../../Constants/app_colors.dart';
import '../../../Constants/app_sizes.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textfield.dart';

class UpdatePackageScreen extends GetView<PackageController> {
  UpdatePackageScreen({super.key});

  final id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Package"),
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
                CustomTextFormField(
                  label: "Name",
                  controller: controller.nameController.value,
                  hintText: "Enter Package Name",
                ),
                AppSizes.hGap12,
                CustomTextFormField(
                  label: "Description",
                  controller: controller.descriptionController.value,
                  hintText: "Enter Package Description",
                ),
                AppSizes.hGap12,
                CustomTextFormField(
                  label: "Price",
                  controller: controller.priceController.value,
                  keyboardType: TextInputType.numberWithOptions(decimal: true,signed: false),
                  maxLength: 10,
                  hintText: "Enter Package Price",
                ),
                AppSizes.hGap30,
                CustomElevatedButton(
                    onPressed: () {
                      if (controller.nameController.value.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Package Name",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (controller
                          .descriptionController.value.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Package Description",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (controller
                          .priceController.value.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Package Price",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        print(id);
                        controller.updatePackage(id[0].toString());
                      }
                    },
                    title: "Update")
              ],
            ),
          ),
        )
    );
  }
}
