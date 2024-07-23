import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_interior/Constants/app_colors.dart';
import 'package:mr_interior/Constants/app_images.dart';
import 'package:mr_interior/Controller/dashboard_controller.dart';
import 'package:mr_interior/RoutesManagment/routes.dart';

import '../Clients/clients_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.DARK_PURPLE, AppColors.LIGHT_PURPLE])),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 14.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person)),
                Text(
                  "User Name",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "user@example.com",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                  },
                  leading: Image.asset(
                    AppImages.HOME,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                    Get.toNamed(RouteConstants.clientScreen);
                  },
                  leading: Image.asset(
                    AppImages.CLIENTS,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Clients',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                    Get.toNamed(RouteConstants.projectScreen);
                  },
                  leading: Image.asset(
                    AppImages.PROJECT,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Projects',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                    Get.toNamed(RouteConstants.designerScreen);
                  },
                  leading: Image.asset(
                    AppImages.PROJECT,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Designer',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                    Get.toNamed(RouteConstants.headcarpenterScreen);
                  },
                  leading: Image.asset(
                    AppImages.PROJECT,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Head Carpenters',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                    // Get.toNamed(RouteConstants.headcarpenterScreen);
                  },
                  leading: Image.asset(
                    AppImages.PROJECT,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Workers',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    AppImages.PRODUCT,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Products',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    _scaffoldKey.currentState!.closeDrawer();
                    Get.toNamed(RouteConstants.packageScreen);
                  },
                  leading: Image.asset(
                    AppImages.PACKAGES,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    'Packages',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    AppImages.ORDERS,
                    height: 22,
                    width: 22,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Orders',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.DARK_PURPLE, AppColors.LIGHT_PURPLE]),
          ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu)),
        title: Text("Partner DashBoard"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_rounded))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
            child: Obx(() => GridView.builder(
                  itemCount: controller.dashboardList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 120,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Get.toNamed(RouteConstants.clientScreen);
                        } else if (index == 1) {
                          Get.toNamed(RouteConstants.projectScreen);
                        } else if (index == 2) {
                          Get.toNamed(RouteConstants.designerScreen);
                        } else if (index == 3) {
                          Get.toNamed(RouteConstants.headcarpenterScreen);
                        } else if (index == 6) {
                          Get.toNamed(RouteConstants.packageScreen);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.DARK_PURPLE,
                                  AppColors.LIGHT_PURPLE
                                ])),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    controller.dashboardList[index]["image"]
                                        .toString(),
                                    color: Colors.white,
                                    height: 35,
                                  ),
                                  Text(
                                    "(${controller.dashboardList[index]["count"].toString()})",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),

                                ],
                              ),
                            ),
                            Text(
                              controller.dashboardList[index]["name"]
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ))),
      ),
    );
  }
}
