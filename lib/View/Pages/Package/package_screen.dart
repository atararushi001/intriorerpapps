import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_interior/Controller/package_controller.dart';

import '../../../Constants/app_colors.dart';
import '../../../RoutesManagment/routes.dart';

class PackageScreen extends GetView<PackageController> {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Package"),
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
                      controller.ClearData();
                      var result = await Get.toNamed(RouteConstants.addpackageScreen);
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
                              "Add Package",
                              style:
                              TextStyle(fontSize: 14, color: Colors.white),
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
                      itemCount: controller.packagesList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
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
                                        "Description",
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
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .packagesList[index].name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        controller
                                            .packagesList[index].description
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "₹${controller.packagesList[index]
                                            .price}",
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
                                             controller
                                                .getPackagesbyId(controller
                                                .packagesList[index]
                                                .id);
                                             var result = await Get.toNamed(RouteConstants.editpackageScreen,arguments: [
                                                        controller
                                                            .packagesList[index]
                                                            .id.toString()
                                                      ]);
                                             if (result == true) {
                                               controller.getPackages();
                                             }
                                          },
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: AppColors
                                                    .DARK_PURPLE),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          onTap: () {
                                            controller.deletePackage(controller
                                                         .packagesList[
                                                     index]
                                                         .id);
                                            // controller
                                            //     .DeleteClient(
                                            //     controller
                                            //         .clientsList[
                                            //     index]
                                            //         .id);
                                            // controller
                                            //     .getClients();
                                            // controller.update();
                                          },
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                                color: AppColors
                                                    .DARK_PURPLE),
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
        )
    );
  }
}