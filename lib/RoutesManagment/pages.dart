import 'package:get/get.dart';
import 'package:mr_interior/RoutesManagment/routes.dart';
import 'package:mr_interior/RoutesManagment/screen_bindings.dart';
import 'package:mr_interior/View/Pages/Clients/clients_screen.dart';
import 'package:mr_interior/View/Pages/Clients/update_client_screen.dart';
import 'package:mr_interior/View/Pages/DashBoard/dashboard.dart';
import 'package:mr_interior/View/Pages/Designer/add_designer_screen.dart';
import 'package:mr_interior/View/Pages/Designer/designer_screen.dart';
import 'package:mr_interior/View/Pages/Designer/update_designer_screen.dart';
import 'package:mr_interior/View/Pages/HeadCarpenter/add_head_carpenter_screen.dart';
import 'package:mr_interior/View/Pages/HeadCarpenter/head_carpenter_screen.dart';
import 'package:mr_interior/View/Pages/HeadCarpenter/update_head_carpenter_screen.dart';
import 'package:mr_interior/View/Pages/Package/add_package_screen.dart';
import 'package:mr_interior/View/Pages/Package/package_screen.dart';
import 'package:mr_interior/View/Pages/Project/add_project_screen.dart';
import 'package:mr_interior/View/Pages/Project/project_screen.dart';

import '../View/Pages/Clients/add_client_screen.dart';
import '../View/Pages/Package/update_package_screen.dart';
import '../View/Pages/Splash/splash_screen.dart';


class AllPages {
  static List<GetPage> getPages() {
    return [
      GetPage(name: RouteConstants.splashScreen, page: () => const SplashScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.dashboardScreen, page: () => DashboardScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.addclientScreen, page: () => AddClientScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.editclientScreen, page: () => UpdateClientScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.clientScreen, page: () => ClientsScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.packageScreen, page: () => PackageScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.addpackageScreen, page: () => AddPackageScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.editpackageScreen, page: () => UpdatePackageScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.projectScreen, page: () => ProjectScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.addprojectScreen, page: () => AddProjectScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.designerScreen, page: () => DesignerScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.adddesignerScreen, page: () => AddDesignerScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.editdesignerScreen, page: () => UpdateDesignerScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.headcarpenterScreen, page: () => HeadCarpenterScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.addheadcarpenterScreen, page: () => AddHeadCarpenterScreen(), binding: ScreenBindings()),
      GetPage(name: RouteConstants.editheadcarpenterScreen, page: () => UpdateHeadCarpenterScreen(), binding: ScreenBindings()),
    ];
  }
}