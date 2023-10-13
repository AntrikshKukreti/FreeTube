import 'package:get/get.dart';
import '../Model/categoriesResponseModel.dart';
import '../Services/categoriesService.dart';

class CategoriesController extends GetxController {
  var videoProcess=false.obs;
  var categoriesData=<CategoriesResponse>[].obs;
  Future<bool> catData() async {
    bool check = false;
    try {
      videoProcess.value = true;
      var catRes = await GetVideoCategories().getCategoriesData();
      if (catRes != null) {
        categoriesData.clear();
        categoriesData.add(catRes);
        categoriesData[0] = catRes;
        check=true;
      }
    } finally {
      videoProcess.value = false;
    }
    return check;
  }
}