import 'package:get/get.dart';
import 'package:mr_interior/Controller/dashboard_controller.dart';
import 'package:mr_interior/Controller/designer_controller.dart';
import 'package:mr_interior/Controller/package_controller.dart';
import 'package:mr_interior/Controller/project_controller.dart';

import '../Controller/client_controller.dart';
import '../Controller/head_carpenter_controller.dart';

class ScreenBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ClientController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => PackageController());
    Get.lazyPut(() => ProjectController());
    Get.lazyPut(() => DesignerController());
    Get.lazyPut(() => HeadCarpenterController());

  }
}