import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_interior/Constants/app_strings.dart';
import 'package:mr_interior/RoutesManagment/routes.dart';
import 'package:mr_interior/View/Pages/Clients/update_client_screen.dart';
import '../../../Constants/app_colors.dart';
import '../../../Controller/client_controller.dart';
import 'add_client_screen.dart';

class ClientsScreen extends GetView<ClientController> {
  const ClientsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Clients"),
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

                      var result = await Get.toNamed(RouteConstants.addclientScreen);
                      if (result == true) {
                        controller.getClients();
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
                              "Add Client",
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
                            itemCount: controller.clientsList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      controller.clientsList[index].profilePicture != "" ?  CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(AppStrings().BASE_IMAGE_URL +controller.clientsList[index].profilePicture),
                                      ) : CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(""),
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
                                                  .clientsList[index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              controller
                                                  .clientsList[index].email
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
                                                      .getClientData(controller
                                                              .clientsList[
                                                                  index]
                                                              .id);
                                                  Get.toNamed(RouteConstants.editclientScreen);
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
                                                      .DeleteClient(
                                                          controller
                                                              .clientsList[
                                                                  index]
                                                              .id);

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
                                            controller.clientsList[index]
                                                        .status ==
                                                    true
                                                ? "Activate"
                                                : "DeActivate",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                color: controller
                                                            .clientsList[index]
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
