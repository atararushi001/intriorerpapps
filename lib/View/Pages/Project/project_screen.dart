import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_interior/Constants/app_sizes.dart';
import 'package:mr_interior/Controller/project_controller.dart';

import '../../../Constants/app_colors.dart';
import '../../../Constants/app_defaults.dart';
import '../../../RoutesManagment/routes.dart';
import '../../Widgets/custom_button.dart';

class ProjectScreen extends GetView<ProjectController> {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project"),
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    // controller.ClearData();
                    var result =
                        await Get.toNamed(RouteConstants.addprojectScreen);
                    if (result == true) {
                      controller.getPackages();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          AppColors.DARK_PURPLE,
                          AppColors.LIGHT_PURPLE
                        ])),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Add Project",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () => Container(
                  child: controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.DARK_PURPLE,
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.projectList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Client",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          controller.projectList[index].designer == null ? Container():Text(
                                            "Designer",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          controller.projectList[index].headCarpenter == null ? Container():Text(
                                            "HeadCarpenter",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Price",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ":  ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ":  ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        controller.projectList[index].designer == null ? Container():Text(
                                          ":  ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        controller.projectList[index].headCarpenter == null ? Container():Text(
                                          ":  ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ":  ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.projectList[index].name,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            controller.projectList[index].client == null ? "":controller.projectList[index].client!.name,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                            maxLines: 1,
                                          ),
                                          controller.projectList[index].designer == null ? Container():Text(
                                            controller.projectList[index].designer!.name,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                            maxLines: 1,
                                          ),
                                          controller.projectList[index].headCarpenter == null ? Container():Text(
                                            controller.projectList[index].headCarpenter!.name,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                            maxLines: 1,
                                          ),
                                          Text(
                                            "₹${controller.projectList[index].totalAmount}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        PopupMenuButton(
                                          iconColor: AppColors.DARK_PURPLE,
                                          position: PopupMenuPosition.under,
                                          surfaceTintColor: Colors.white,
                                          shadowColor: Colors.white,
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: 1,
                                              onTap: () async {
                                                controller.designername.value = controller.projectList[index].designer == null ? "-- No Designer Select --":controller.projectList[index].designer!.name.toString();
                                                controller.designerId.value = controller.projectList[index].designer == null ? "":controller.projectList[index].designer!.id.toString();
                                                Get.defaultDialog(
                                                  title: "Designer",
                                                  titleStyle: AppDefaults
                                                      .textStyleBold20(
                                                      fontColor:
                                                      AppColors
                                                          .DARK_PURPLE),
                                                  content : Obx(() =>
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            height: 45,
                                                            width: double.infinity,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .LIGHT_PURPLE
                                                                    .withOpacity(
                                                                        0.3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton2<
                                                                      String>(
                                                                isExpanded:
                                                                    true,
                                                                hint: Text(
                                                                  '-- No Designer Select --',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .hintColor,
                                                                  ),
                                                                ),
                                                                items: controller
                                                                    .designersnameList
                                                                    .map((String
                                                                            item) =>
                                                                        DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              item,
                                                                          child:
                                                                              Text(
                                                                            item,
                                                                            style:
                                                                                TextStyle(fontSize: 14, color: AppColors.DARK_PURPLE),
                                                                          ),
                                                                        ))
                                                                    .toList(),
                                                                value: controller
                                                                    .designername
                                                                    .value,
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                          .designername
                                                                          .value =
                                                                      value
                                                                          .toString();
                                                                  print(value
                                                                      .toString());
                                                                  int index = controller
                                                                      .designersnameList
                                                                      .indexWhere((item) =>
                                                                          item ==
                                                                          value);
                                                                  controller
                                                                          .designerId
                                                                          .value =
                                                                      controller
                                                                          .designersList[index -
                                                                              1]
                                                                          .id
                                                                          .toString();
                                                                  // print(controller.countrylist[index].id);
                                                                  // controller.getState();
                                                                  controller
                                                                      .update();
                                                                },
                                                                buttonStyleData:
                                                                    const ButtonStyleData(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              16),
                                                                  height: 40,
                                                                  width: 140,
                                                                ),
                                                                menuItemStyleData:
                                                                    const MenuItemStyleData(
                                                                  height: 40,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          AppSizes.hGap12,
                                                          CustomElevatedButton(
                                                              onPressed: () {
                                                                controller.AssignDesignerAPI(
                                                                    controller
                                                                        .projectList[
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                    controller
                                                                        .designerId
                                                                        .value);
                                                              },
                                                              title: "Submit")
                                                        ],
                                                      )),
                                                );
                                              },
                                              child: Text(
                                                "Assign Designer",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.DARK_PURPLE),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 2,
                                              onTap: () async {
                                                controller.headcarpentername.value = controller.projectList[index].headCarpenter == null ? "-- No Head Carpenter Select --":controller.projectList[index].headCarpenter!.name.toString();
                                                controller.headcarpenterId.value = controller.projectList[index].headCarpenter == null ? "":controller.projectList[index].headCarpenter!.id.toString();
                                                Get.defaultDialog(
                                                  title: "Head Carpenter",
                                                  titleStyle: AppDefaults
                                                      .textStyleBold20(
                                                      fontColor:
                                                      AppColors
                                                          .DARK_PURPLE),
                                                  content : Obx(() =>
                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            height: 45,
                                                            width: double.infinity,
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
                                                          AppSizes.hGap12,
                                                          CustomElevatedButton(
                                                              onPressed: () {
                                                                controller.AssignDCarpenterAPI(
                                                                    controller
                                                                        .projectList[
                                                                    index]
                                                                        .id
                                                                        .toString(),
                                                                    controller
                                                                        .headcarpenterId
                                                                        .value);
                                                              },
                                                              title: "Submit")
                                                        ],
                                                      )),
                                                );
                                              },
                                              child: Text(
                                                "Assign Head Caerpenter",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.DARK_PURPLE),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 3,
                                              onTap: () async {
                                                // controller
                                                //     .getPackagesbyId(controller
                                                //     .packagesList[index]
                                                //     .id);
                                                // var result = await Get.toNamed(RouteConstants.editpackageScreen,arguments: [
                                                //   controller
                                                //       .packagesList[index]
                                                //       .id.toString()
                                                // ]);
                                                // if (result == true) {
                                                //   controller.getPackages();
                                                // }
                                              },
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.DARK_PURPLE),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 4,
                                              onTap: () {
                                                controller.DeleteProject(controller
                                                    .projectList[
                                                index]
                                                    .id);
                                                controller.update();
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.DARK_PURPLE),
                                              ),
                                            ),
                                          ],
                                          offset: Offset(0, 0),
                                          color: Colors.white,
                                          elevation: 2,
                                        ),

                                        // Text("status",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
