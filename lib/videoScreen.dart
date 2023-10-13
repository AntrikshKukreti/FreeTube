import 'package:flutter/material.dart';
import 'package:freetube/Screens/playVideo.dart';
import 'package:get/get.dart';
import 'API/Response/videosResponse.dart';

class VideoScreen extends StatefulWidget {

  // const VideoScreen({super.key, required this.index});
  // final int index;
  const VideoScreen({super.key});


  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final videoController = Get.put(VideoController());

  @override
  void initState() {
    videoController.videoData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      videoController.youTubeData.isNotEmpty?
      ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: videoController.youTubeData[0].items!.length,
          itemBuilder: (BuildContext context, int index) {
            return

              GestureDetector(
                onTap: ((){
                  Get.to(()=>VideoPlay(id: videoController.youTubeData[0].items![index].id!));
                }),
                child: Padding(
                padding: EdgeInsets.only(bottom: Get.height*0.03 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height*0.33,
                      width: Get.width,
                      child:  Image(
                        image: NetworkImage(videoController.youTubeData[0].items![index].snippet!.thumbnails!.standard!.url!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width*0.02,vertical: 8.0),
                      child: SizedBox(
                        width: Get.width*0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: Get.width*0.02),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child:
                                    Image(
                                      image: NetworkImage(videoController.youTubeData[0].items![index].snippet!.thumbnails!.medium!.url!),
                                      width: MediaQuery.of(context).size.width * 0.06,
                                    ),),
                                ),
                                SizedBox(
                                  width: Get.width*0.8,
                                  child: Text(videoController.youTubeData[0].items![index].snippet!.title.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.more_vert,color: Theme.of(context).colorScheme.primary,),
                          ],),
                      ),
                    )
                  ],
                ),
            ),
              );
          })
      :
       Center(
         child: Container(
           height: 100.0,
           width: 100.0,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10.0),
             color: Colors.black.withOpacity(0.5)
           ),
           child: const Center(child: CircularProgressIndicator(color: Colors.grey,)),
         ),
       )
    );
  }
}
