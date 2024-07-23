import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Constants/app_images.dart';
import '../Constants/app_strings.dart';
import '../Model/clients_model.dart';
import '../Model/package_model.dart';
import '../Model/project_model.dart';

class DashboardController extends GetxController with WidgetsBindingObserver {
  var isLoading = false.obs;
  RxList dashboardList = [].obs;
  RxList<Clients> clientsList = <Clients>[].obs;
  RxList<Clients> designersList = <Clients>[].obs;
  RxList<Clients> headcarpenterList = <Clients>[].obs;
  RxList<Packages> packagesList = <Packages>[].obs;
  RxList<Projects> projectList = <Projects>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetData();
    getClients();
    getPackages();
    GetProjects();
  }

  GetData() {
    dashboardList.value = [
      {
        "name": "Client",
        "image": AppImages.CLIENTS,
        "count": "0",
      },
      {
        "name": "Project",
        "image": AppImages.PROJECT,
        "count": "0",
      },
      {
        "name": "Designer",
        "image": AppImages.PROJECT,
        "count": "0",
      },
      {
        "name": "Head Carpenter",
        "image": AppImages.PROJECT,
        "count": "0",
      },
      {
        "name": "Worker",
        "image": AppImages.PROJECT,
        "count": "0",
      },
      {
        "name": "Product",
        "image": AppImages.PRODUCT,
        "count": "0",
      },
      {
        "name": "Package",
        "image": AppImages.PACKAGES,
        "count": "0",
      },
      {
        "name": "Order",
        "image": AppImages.ORDERS,
        "count": "0",
      }
    ];
    update();
  }

  void getClients() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}users'));

      if (response.statusCode == 200) {
        List<Clients> tempclientlist = clientsFromJson(response.body);
        for(int i = 0 ; i < tempclientlist.length; i++){
          if(tempclientlist[i].role == "Client"){
            clientsList.add(tempclientlist[i]);
          } else if(tempclientlist[i].role == "Designer"){
            designersList.add(tempclientlist[i]);
          } else if(tempclientlist[i].role == "Head Carpenter"){
            headcarpenterList.add(tempclientlist[i]);
          }
        }
        dashboardList[0]["count"] = clientsList.length.toString();
        dashboardList[2]["count"] = designersList.length.toString();
        dashboardList[3]["count"] = headcarpenterList.length.toString();
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  void GetProjects() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}projects'));

      if (response.statusCode == 200) {
        projectList.value = projectsFromJson(response.body);
        dashboardList[1]["count"] = projectList.length.toString();
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }

  }

  void getPackages() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${AppStrings().BASE_URL}packages'));

      if (response.statusCode == 200) {
        packagesList.value = packagesFromJson(response.body);
        dashboardList[6]["count"] = packagesList.length.toString();
        update();
      } else {
        print(response.reasonPhrase);
      }
    } finally {
      isLoading(false);
    }
  }

  
}
