// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter95/flutter95.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:retroz/controllers/mainController.dart';
import 'package:retroz/view/setwal.dart';
import '../controllers/firebaseController.dart';
import 'mainViewWidgets.dart';

final maincon = Get.put(MainController());
final firebaseController = Get.put(Firebasecon());

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 128, 128, 1.0),
      body: SafeArea(
          child: Container(
        width: Get.width,
        height: Get.height,
        color: const Color.fromRGBO(0, 128, 128, 1.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Window(
                  val: 0.0,
                  va2: 0.0,
                  Child: Column(
                    children: [
                      // TOP BAR START
                      TopBar(
                        Child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Retroz 98- ',
                                  style: GoogleFonts.righteous(
                                    fontSize: 18,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    maincon.title.value,
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  if (maincon.menubtn.value == 1) {
                                    maincon.menubtn.value = 0;
                                  } else {
                                    maincon.menubtn.value = 1;
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1, left: 4),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 29.5,
                                        width: 41.5,
                                        decoration: BoxDecoration(
                                          color: maincon.menubtn.value == 1
                                              ? const Color.fromRGBO(
                                                  192, 192, 192, 1.0)
                                              : Colors.white,
                                          border: Border(
                                            left: BorderSide(
                                              width: 1.5,
                                              color: maincon.menubtn.value == 1
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                            top: BorderSide(
                                              width: 1.5,
                                              color: maincon.menubtn.value == 1
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                            right: BorderSide(
                                              width: maincon.menubtn.value == 1
                                                  ? 1.5
                                                  : 1,
                                              color: maincon.menubtn.value == 1
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                            bottom: BorderSide(
                                              width: maincon.menubtn.value == 1
                                                  ? 1.5
                                                  : 1,
                                              color: maincon.menubtn.value == 1
                                                  ? Colors.black
                                                  : const Color.fromRGBO(
                                                      192, 192, 192, 1.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 28,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                223, 223, 223, 1.0),
                                            border: Border(
                                              left: BorderSide(
                                                width: 1.5,
                                                color:
                                                    maincon.menubtn.value == 1
                                                        ? const Color.fromRGBO(
                                                            223, 223, 223, 1.0)
                                                        : const Color.fromRGBO(
                                                            128, 128, 128, 1.0),
                                              ),
                                              top: BorderSide(
                                                width: 1.5,
                                                color:
                                                    maincon.menubtn.value == 1
                                                        ? const Color.fromRGBO(
                                                            223, 223, 223, 1.0)
                                                        : const Color.fromRGBO(
                                                            128, 128, 128, 1.0),
                                              ),
                                              right: BorderSide(
                                                width: 1.5,
                                                color:
                                                    maincon.menubtn.value == 1
                                                        ? const Color.fromRGBO(
                                                            128, 128, 128, 1.0)
                                                        : const Color.fromRGBO(
                                                            223, 223, 223, 1.0),
                                              ),
                                              bottom: BorderSide(
                                                width: 1.5,
                                                color:
                                                    maincon.menubtn.value == 1
                                                        ? const Color.fromRGBO(
                                                            128, 128, 128, 1.0)
                                                        : const Color.fromRGBO(
                                                            223, 223, 223, 1.0),
                                              ),
                                            ),
                                          ),
                                          child: const Menubtn()),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // slide top bar
                      Obx(
                        () => Visibility(
                          visible: maincon.menubtn.value == 0 ? true : false,
                          child: const Taskbar(
                            Child: null,
                            Height: 70.0,
                          ),
                        ),
                      ),

                      // TOP BAR END

                      Obx(() => Visibility(
                            visible: maincon.visibl.value == 0 ? true : false,
                            child: Expanded(
                              child: firebaseController.pixelList.value == []
                                  ? const CircularProgressIndicator()
                                  : StaggeredGridView.countBuilder(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(2),
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      crossAxisCount: 2,
                                      itemCount: firebaseController
                                          .pixelList.value.length,
                                      itemBuilder: (context, index) =>
                                          CardX(index),
                                      staggeredTileBuilder: (index) =>
                                          const StaggeredTile.fit(1)),
                            ),
                          )),
                      Obx(() => Visibility(
                            visible: maincon.visibl.value == 1 ? true : false,
                            child: Expanded(
                              child: firebaseController.retroList.value == []
                                  ? const CircularProgressIndicator()
                                  : StaggeredGridView.countBuilder(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(2),
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      crossAxisCount: 2,
                                      itemCount: firebaseController
                                          .retroList.value.length,
                                      itemBuilder: (context, index) =>
                                          CardR(index),
                                      staggeredTileBuilder: (index) =>
                                          const StaggeredTile.fit(1)),
                            ),
                          )),
                      Obx(() => Visibility(
                            visible: maincon.visibl.value == 2 ? true : false,
                            child: Expanded(
                              child: firebaseController.waveList.value == []
                                  ? const CircularProgressIndicator()
                                  : StaggeredGridView.countBuilder(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(2),
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      crossAxisCount: 2,
                                      itemCount: firebaseController
                                          .waveList.value.length,
                                      itemBuilder: (context, index) =>
                                          CardW(index),
                                      staggeredTileBuilder: (index) =>
                                          const StaggeredTile.fit(1)),
                            ),
                          )),
                    ],
                  ),
                ),
                Taskbar(
                  Height: 35.0,
                  Child: Row(
                    children: const [
                      StartMenu(),
                      Spacer(),
                      Pxlbtn(
                        name: "Pixel",
                        img: 'lib/assets/tetris.png',
                      ),
                      Rtrbtn(
                        name: "Retro",
                        img: 'lib/assets/retro.png',
                      ),
                      Wavebtn(
                        name: "Wave",
                        img: 'lib/assets/vaporwave-png.png',
                      )
                    ],
                  ),
                )
              ],
            ),
            Obx(() => Visibility(
                visible: maincon.buttonclick.value == 0 ? true : false,
                child: const Startmenu())),
            Obx(() => Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: maincon.popupbtn.value == 1 ? true : false,
                    child: Window(
                      val: 1.0,
                      va2: 1.0,
                      Child: Container(
                        width: 230,
                        height: 180,
                        color: const Color.fromRGBO(192, 192, 192, 1.0),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0,
                                              right: 8.0,
                                              top: 8.0,
                                              left: 2.0),
                                          child: Image.asset(
                                            "lib/assets/reset.png",
                                            width: 23,
                                          ),
                                        ),
                                        Text(
                                          "Reset",
                                          style: GoogleFonts.ibmPlexSans(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print('close');
                                        maincon.popupbtn.value = 0;
                                      },
                                      child: SizedBox(
                                          width: 20,
                                          child: Image.asset(
                                              'lib/assets/close.png')),
                                    ),
                                  )
                                ]),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            Container(
                              height: 0.7,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Container(
                                width: 230,
                                color: Colors.grey,
                                child: Stack(children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Reset to orginal wallpaper !',
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  letterSpacing: 0.0)),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Button95(
                                              onTap: () {
                                                maincon.ResetWall();
                                                maincon.popupbtn.value = 0;
                                              },
                                              child: Text("OK"),
                                            ),
                                          )
                                        ],
                                      ))
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}

class Startmenu extends StatelessWidget {
  const Startmenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 35,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(width: 1.5, color: Colors.white),
            top: BorderSide(width: 1.5, color: Colors.white),
            right: BorderSide(width: 1, color: Colors.black),
            bottom: BorderSide(width: 1, color: Colors.black),
          ),
        ),
        child: Container(
          width: 180,
          height: 300,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(192, 192, 192, 1.0),
              border: Border(
                bottom: BorderSide(
                    width: 1.5, color: Color.fromRGBO(128, 128, 128, 1.0)),
                right: BorderSide(
                    width: 1.5, color: Color.fromRGBO(128, 128, 128, 1.0)),
                left: BorderSide(
                    width: 1.5, color: Color.fromRGBO(223, 223, 223, 1.0)),
                top: BorderSide(
                    width: 1.5, color: Color.fromRGBO(223, 223, 223, 1.0)),
              )),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(1, 1, 237, 1.0),
                      Color.fromRGBO(1, 0, 128, 1.0)
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "RETROZ",
                        style: GoogleFonts.righteous(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "98",
                        style: GoogleFonts.righteous(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 1.3,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 0.5,
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("info");
                          },
                          child: Container(
                            color: const Color.fromRGBO(192, 192, 192, 1.0),
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0,
                                      right: 4.0,
                                      top: 4.0,
                                      left: 2.0),
                                  child: Image.asset(
                                    "lib/assets/info.png",
                                    width: 28,
                                  ),
                                ),
                                Text(
                                  "Info",
                                  style: GoogleFonts.ibmPlexSans(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Reset");
                            maincon.popupbtn.value = 1;
                          },
                          child: Container(
                            color: const Color.fromRGBO(192, 192, 192, 1.0),
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0,
                                      right: 4.0,
                                      top: 4.0,
                                      left: 2.0),
                                  child: Image.asset(
                                    "lib/assets/reset.png",
                                    width: 28,
                                  ),
                                ),
                                Text(
                                  "Reset",
                                  style: GoogleFonts.ibmPlexSans(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Menubtn extends StatelessWidget {
  const Menubtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Center(
        child: SizedBox(
          width: 40,
          height: 50,
          child: Column(children: [
            Container(
              width: 30,
              height: 2.5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 2.5,
            ),
            Container(
              width: 20,
              height: 2.5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 2.5,
            ),
            Container(
              width: 10,
              height: 2.5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 2.5,
            ),
            Container(
              width: 3,
              height: 2.5,
              color: Colors.black,
            ),
          ]),
        ),
      ),
    );
  }
}

Widget CardX(int index) => GestureDetector(
      onTap: () {
        Get.to(const Setwal(),
            arguments: [(firebaseController.pixelList.value[index])]);
      },
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: const Color.fromRGBO(192, 192, 192, 1.0))),
            child: Image.network(firebaseController.pixelList.value[index])),
      ),
    );

Widget CardR(int index) => Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: const Color.fromRGBO(192, 192, 192, 1.0))),
          child: Image.network(firebaseController.retroList.value[index])),
    );

Widget CardW(int index) => Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: const Color.fromRGBO(192, 192, 192, 1.0))),
          child: Image.network(firebaseController.waveList.value[index])),
    );
