import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freetube/videoScreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'API/Response/categoriesResponse.dart';
import 'Constants/constant.dart';
import 'Screens/search.dart';

final constant = Constants();

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});
  final String title;
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    categoriesController.catData();
    super.initState();
  }

  final categoriesController = Get.put(CategoriesController());
  var client = http.Client();
  var jsonResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.youtube,
                      color: const Color(0xffff0b15),
                      size: MediaQuery.of(context).size.width * 0.1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.chromecast,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          FaIcon(
                            FontAwesomeIcons.bell,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          GestureDetector(
                            onTap: ((){
                              Get.to(() => const Search());
                            }),
                            child: FaIcon(
                              FontAwesomeIcons.search,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Image(
                                image:
                                const AssetImage('assets/images/user.png'),
                                width: MediaQuery.of(context).size.width * 0.06,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.compass,
                        color: Theme.of(context).colorScheme.primary,
                        size: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Obx(() =>
                      categoriesController.categoriesData.isNotEmpty?
                      SizedBox(
                        height: 25.0,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: categoriesController.categoriesData[0].items!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.grey[100],
                                  ),
                                  child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.02),
                                        child: Text(categoriesController.categoriesData[0].items![index].snippet!.title!,
                                          style:
                                          const TextStyle(color: Colors.black),
                                        ),
                                      )),
                                ),
                              );
                            }),
                      )
                          :
                      const SizedBox()
                      ),
                    ],
                  ),
                )
              ],
            )),
        body:SizedBox(
          width: Get.width,
          height: Get.height,
          child: const VideoScreen(),
        ));
  }
}
