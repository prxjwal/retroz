import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retroz/view/mainViewWidgets.dart';
import 'package:flutter95/flutter95.dart';
import '../controllers/mainController.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final maincon = Get.put(MainController());

class Setwal extends StatelessWidget {
  const Setwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 1.3,
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Image.network(
                      Get.arguments[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Window(
                  val: 1.0,
                  va2: 2.3,
                  Child: Container(
                    width: Get.width,
                    color: const Color.fromRGBO(0, 128, 128, 1.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 200,
                                height: 30,
                                color: const Color.fromRGBO(192, 192, 192, 1.0),
                                child: const Center(
                                    child: Text("Set Home Screen Wallpaper")),
                              ),
                              Button95(
                                onTap: () {
                                  maincon.setWallpaper(Get.arguments[0]);
                                },
                                child: const Text("OK"),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 200,
                                height: 30,
                                color: const Color.fromRGBO(192, 192, 192, 1.0),
                                child: const Center(
                                    child: Text("Set Lock Screen Wallpaper")),
                              ),
                              Button95(
                                onTap: () {
                                  maincon.setWallpaperLock(Get.arguments[0]);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 200,
                                height: 30,
                                color: const Color.fromRGBO(192, 192, 192, 1.0),
                                child: const Center(
                                    child: Text("Set Both Screen Wallpaper")),
                              ),
                              Button95(
                                onTap: () {
                                  maincon.setWallpaper(Get.arguments[0]);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          )),
          Obx(() => Visibility(
                visible: maincon.isLoading.value ? true : false,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 150,
                      height: 100,
                      color: const Color.fromRGBO(192, 192, 192, 1.0),
                      child: Window(
                          Child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Loading ...',
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.black, size: 35)
                            ],
                          ),
                          val: 1.0,
                          va2: 1.0)),
                ),
              ))
        ],
      ),
    );
  }
}
