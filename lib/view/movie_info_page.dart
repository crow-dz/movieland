import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/home_crt.dart';
import '../model/top_rated_tv.dart';
import '../utils/const/links.dart';
import 'widgets/Filter_icons.dart';
import 'widgets/btnTrans.dart';

class MoviePage extends StatelessWidget {
  MoviePage({super.key , required this.movieData});
  Map  movieData;
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
              Positioned(
                  top: 0,
                  left: 0,
                  child: Stack(
                    children: [
                      Image.network(
                       Links.imageUrl +  movieData[ "poster_path"],
                        width: Get.width,
                        height: Get.height / 1.9,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: const Border(
                                  bottom: BorderSide(
                                      width: 2, color: Color(0xff0a0b13))),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    const Color(0xff0a0b13).withOpacity(1)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.6, 0.95])),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  top: 54,
                  left: 42,
                  right: 42,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const buttontrans(
                          ico: Icons.arrow_back,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const buttontrans(
                        ico: Ionicons.heart_sharp,
                      ),
                    ],
                  )),
              Positioned(
                  top: Get.height / 2.4,
                  left: Get.width / 2.5,
                  child: SizedBox(
                      child: SvgPicture.asset(
                    "asstes/playsvg.svg",
                    allowDrawingOutsideViewBox: false,
                    width: 80,
                    height: 80,
                  ))),
              Positioned(
                top: 400,
                left: 70,
                child: Text(movieData["name"],
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFFFFFFFF)),
                    )),
              ),
              Positioned(
                top: 444,
                left: 61,
                child: Text("${movieData["first_air_date"]} | Action,Crime,Drama | Episode - 8",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xFFFFFFFF)),
                    )),
              ),
              Positioned(
                top: 491,
                left: 48,
                right: 48,
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18, color: Color(0xFFFFFFFF)),
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Episodes ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 450,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.episode.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 29),
                              child: Container(
                                height: 161,
                                width: 109,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Image.asset(
                                      "asstes/${controller.episode[index]}.png",
                                    ),
                                  ),
                                  Positioned(
                                    top: 190,
                                    left: 15,
                                    child: Text("Episode - ${index + 1}",
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Color(0xFFFFFFFF)),
                                        )),
                                  ),
                                  Positioned(
                                    top: 210,
                                    left: 27,
                                    right: 27,
                                    child: Text("The End of the Road",
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10,
                                              color: Color(0xFFA0A0A0)),
                                        )),
                                  )
                                ]),
                              ),
                            ),
                            onTap: () {
                           //   Get.to(() => MoviePage());
                            },
                          );
                        }),
                  )),
              Positioned(
                top: 712,
                left: 48,
                child: Text("Polt",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFFFFFFFF)),
                    )),
              ),
              Positioned(
                top: 752,
                left: 48,
                right: 48,
                child: Text(
                    "Eight thieves take hostages and lock themselves in the Royal Mint of Spain as a criminal mastermind manipulates the police to carry out his plan.",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xFFA0A0A0)),
                    )),
              ),
              Positioned(
                  top: 800,
                  left: 48,
                  right: 48,
                  child: Container(
                    height: 50,
                  )),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
