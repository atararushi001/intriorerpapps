import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_interior/Controller/head_carpenter_controller.dart';
import 'package:mr_interior/RoutesManagment/routes.dart';
import 'package:mr_interior/View/Pages/Clients/update_client_screen.dart';
import '../../../Constants/app_colors.dart';

import 'add_head_carpenter_screen.dart';

class HeadCarpenterScreen extends GetView<HeadCarpenterController> {
  const HeadCarpenterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Head Carpenters"),
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

                      var result = await Get.toNamed(RouteConstants.addheadcarpenterScreen);
                      if (result == true) {
                        controller.getHeadCarpenters();
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
                              "Add Head Carpenter",
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
                            itemCount: controller.headcarpenterList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                  .headcarpenterList[index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              controller
                                                  .headcarpenterList[index].email
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
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
                                                onTap: () {
                                                  controller
                                                      .getHeadCarpenterData(controller
                                                              .headcarpenterList[
                                                                  index]
                                                              .id);
                                                  Get.toNamed(RouteConstants.editheadcarpenterScreen);
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
                                                  controller
                                                      .DeleteHeadCarpenter(
                                                          controller
                                                              .headcarpenterList[
                                                                  index]
                                                              .id);
                                                  controller
                                                      .getHeadCarpenters();
                                                  controller.update();
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
                                          Text(
                                            controller.headcarpenterList[index]
                                                        .status ==
                                                    true
                                                ? "Activate"
                                                : "DeActivate",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                color: controller
                                                            .headcarpenterList[index]
                                                            .status ==
                                                        true
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
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
        ));
  }
}
