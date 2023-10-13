import 'package:get/get.dart';
import '../Model/searchResponseModel.dart';
import '../Services/searchServices.dart';

class SearchDataController extends GetxController {
  var videoProcess=false.obs;
  var searchData=<SearchResponse>[].obs;
  Future<bool> sData(String val) async {
    bool check = false;
    try {
      videoProcess.value = true;
      var searchRes = await SearchData().getSearchData(val);
      if (searchRes != null) {
        searchData.clear();
        searchData.add(searchRes);
        searchData[0] = searchRes;
        check=true;
      }
    } finally {
      videoProcess.value = false;
    }
    return check;
  }
}