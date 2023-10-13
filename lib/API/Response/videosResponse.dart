import 'package:get/get.dart';
import '../Services/videoServices.dart';
import '../Model/videoResponseModel.dart';

class VideoController extends GetxController {
  var videoProcess=false.obs;
  var youTubeData=<VideosResponse>[].obs;
  Future<bool> videoData() async {
    bool check = false;
    try {
      videoProcess.value = true;
      var vdRes = await GetVideos().getVideoData();
      if (vdRes != null) {
        youTubeData.clear();
        youTubeData.add(vdRes);
        youTubeData[0] = vdRes;
        check=true;
      }
    } finally {
      videoProcess.value = false;
    }
    return check;
  }
}