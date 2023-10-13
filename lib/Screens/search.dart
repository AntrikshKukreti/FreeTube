import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freetube/Screens/playVideo.dart';
import 'package:get/get.dart';
import '../API/Response/searchResponse.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = Get.put(SearchDataController());
  Timer? _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      searchController.sData(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(
          width: Get.width,
          height: 35.0,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width*0.7,
                child: TextField(
                  onChanged: (val) {
                    _onSearchChanged(val);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search YouTube',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    labelStyle:
                    const TextStyle(fontSize: 12),
                    contentPadding:
                    const EdgeInsets.only(left: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.transparent),
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.transparent),
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: ((){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    content: Text("Will be availabe in next update..!",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                  ));
                }),
                child: FaIcon(
                  FontAwesomeIcons.microphone,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          )
        ),
      ),


      body:Obx(() =>
      searchController.searchData.isNotEmpty?
      ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: searchController.searchData[0].items!.length,
          itemBuilder: (BuildContext context, int index) {
            return
              GestureDetector(
                onTap: ((){
                  Get.to(()=>VideoPlay(id: searchController.searchData[0].items![index].id!.videoId!));
                }),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                      width: Get.width*0.95,
                      height: 35.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width*0.8,
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.search,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: MediaQuery.of(context).size.width * 0.04,
                                ),
                                SizedBox(
                                  width: Get.width*0.75,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(searchController.searchData[0].items![index].snippet!.title.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: Get.width*0.02),
                            child: SizedBox(
                              height: 32.0,
                              width: Get.width*0.1,
                              child:
                              Image(
                                image: NetworkImage(searchController.searchData[0].items![index].snippet!.thumbnails!.medium!.url!),
                                fit: BoxFit.contain,
                              ),),
                          ),
                        ],),
                    ),
                  ),
                ),
              );
          }):
       Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             FaIcon(
              FontAwesomeIcons.search,
              color: Theme.of(context).colorScheme.primary,
               size: Get.height*0.05,
      ),
             const SizedBox(
               height: 20.0,
             ),
             const Text('Looking for Something ...!',style: TextStyle(fontWeight: FontWeight.bold),)
           ],
         ),
       ),
    ));
  }
}
