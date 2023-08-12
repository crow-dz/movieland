import 'dart:developer';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieland/controller/home_crt.dart';
import 'package:movieland/model/top_rated_tv.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../data/fetch_data.dart';
import '../utils/const/all_asstes.dart';
import '../utils/const/links.dart';
import 'movie_info_page.dart';
import 'widgets/Filter_icons.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GetBuilder<HomeController>(
          builder: (controller) {
            return FlashyTabBar(
              backgroundColor: const Color(0xff08080f),
              selectedIndex: controller.selectedIndex.value,
              showElevation: true,
              onItemSelected: (index) {
                controller.change(index);
              },
              items: [
                FlashyTabBarItem(
                  activeColor: const Color(0xFFFFFFFF),
                  icon: SvgPicture.asset(
                    "asstes/home.svg",
                    color: const Color(0xfff51535d),
                    allowDrawingOutsideViewBox: false,
                    width: 26,
                    height: 26,
                  ),
                  title: Text('Home',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                      )),
                ),
                FlashyTabBarItem(
                  activeColor: const Color(0xFFFFFFFF),
                  icon: SvgPicture.asset(
                    "asstes/PLay.svg",
                    color: const Color(0xfff51535d),
                    allowDrawingOutsideViewBox: false,
                    width: 26,
                    height: 26,
                  ),
                  title: Text('Search',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                      )),
                ),
                FlashyTabBarItem(
                  activeColor: const Color(0xFFFFFFFF),
                  icon: SvgPicture.asset(
                    "asstes/search.svg",
                    color: const Color(0xfff51535d),
                    allowDrawingOutsideViewBox: false,
                    width: 26,
                    height: 26,
                  ),
                  title: Text('Highlights',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                      )),
                ),
                FlashyTabBarItem(
                  activeColor: const Color(0xFFFFFFFF),
                  icon: SvgPicture.asset(
                    "asstes/profile.svg",
                    color: const Color(0xfff51535d),
                    allowDrawingOutsideViewBox: false,
                    width: 26,
                    height: 26,
                  ),
                  title: Text('Settings',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                      )),
                ),
              ],
            );
          },
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    child: SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Image.asset(
                          "asstes/background.png",
                          fit: BoxFit.cover,
                        ))),
                // User info
                Positioned(
                    top: 54,
                    left: 48,
                    right: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello Daizy!",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 24, color: Color(0xFFFFFFFF)),
                              ),
                            ),
                            Text("Check for latest addition.",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14, color: Color(0xFFA0A0A0)),
                                )),
                          ],
                        ),
                        ClipRRect(child: Image.asset("asstes/avatar.png"))
                      ],
                    )),
                Positioned(
                    top: 151,
                    left: 48,
                    right: 48,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              AllAsstes.search_icon,
                              color: Colors.white,
                              allowDrawingOutsideViewBox: false,
                            ),
                          ),
                        ),

                        /*  const ImageIcon(
                         ("asstes/scop.png",),
                            color: Color(0xFFFFFFFF),
                          ), */
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "asstes/mic.svg",
                            color: Colors.white,
                            allowDrawingOutsideViewBox: false,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF767680),
                        hintText: 'Search',
                        hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14, color: Color(0xFFA0A0A0)),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        enabledBorder: const UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.white30,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top: 239,
                    left: 48,
                    right: 48,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Filters",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFFFFFFFF)),
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            filers("gener", 'Gener'),
                            filers("star", 'Top IMDB'),
                            filers("lan", 'Language'),
                            filers("disck", 'Watched'),
                          ],
                        )
                      ],
                    )),
                Positioned(
                  top: 392,
                  left: 48,
                  right: 48,
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 24, color: Color(0xFFFFFFFF)),
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Featured ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Series'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 440,
                    left: 0,
                    right: 0,
                    bottom: 100,
                    child: SizedBox(child: Obx(
                      () {
                        if (controller.isLoading.value && controller.topRatedTv != null ) { 
                          log(controller.topRatedTv.toString());
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.topRatedTv!.results!.length,
                              itemBuilder: (BuildContext context, int index) {
                               //log(controller.topRatedTv!.results![index].toJson().toString());
                                return InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 29 - 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          Links.imageUrl +
                                              controller.topRatedTv!
                                                  .results![index].posterPath!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                 fetchTvDetails(controller.topRatedTv!.results![index].id!);
                                  Get.to(() => MoviePage(movieData:controller.topRatedTv!.results![index].toJson() ,));
                                  },
                                );
                              });
                        } else {
                          return SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 29 - 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Shimmer(
                                        duration: const Duration(seconds: 3),
                                        interval: const Duration(seconds: 5),
                                        color: Colors.white,
                                        colorOpacity: 0,
                                        enabled: true,
                                        child: Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Container(
                                            color: Colors.white.withOpacity(
                                                0.01), // any color you want
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                  //  Get.to(() => MoviePage());
                                  },
                                );
                              },
                            ),
                          );
                        }
                      },
                    ))),
              ],
            ),
          ),
        ) /* }) */);
  }
}
