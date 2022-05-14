import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/mainController.dart';

final maincon = Get.put(MainController());

class TopBar extends StatelessWidget {
  const TopBar({
    this.Child,
    Key? key,
  }) : super(key: key);
  final Child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 35,
      color: const Color.fromRGBO(192, 192, 192, 1.0),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 1.0, right: 1.0, top: 1.0, left: 0.3),
        child: Container(
          child: Child,
          width: Get.width,
          height: 32,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(128, 128, 128, 1.0),
                Color.fromRGBO(175, 175, 175, 1.0)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
    );
  }
}

class Window extends StatelessWidget {
  const Window({
    @required this.Child,
    @required this.val,
    @required this.va2,
    Key? key,
  }) : super(key: key);
  final Child;
  final val;
  final va2;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Expanded(
            child: Container(
          child: Container(
            child: Container(
              child: Child,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    width: val,
                    color: const Color.fromRGBO(128, 128, 128, 1.0)),
                right: const BorderSide(
                    width: 1, color: Color.fromRGBO(128, 128, 128, 1.0)),
                left: const BorderSide(
                    width: 1, color: Color.fromRGBO(128, 128, 128, 1.0)),
                top: const BorderSide(
                  width: 1,
                  color: Color.fromRGBO(128, 128, 128, 1.0),
                ),
              )),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: va2,
                    color: const Color.fromRGBO(192, 192, 192, 1.0)),
                right: const BorderSide(
                    width: 2.3, color: Color.fromRGBO(192, 192, 192, 1.0)),
                left: const BorderSide(
                    width: 2.3, color: Color.fromRGBO(192, 192, 192, 1.0)),
                top: const BorderSide(
                  width: 2.3,
                  color: Color.fromRGBO(192, 192, 192, 1.0),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: val,
                    color: const Color.fromRGBO(223, 223, 223, 1.0)),
                right: const BorderSide(
                    width: 1, color: Color.fromRGBO(223, 223, 223, 1.0)),
                left: const BorderSide(
                    width: 1, color: Color.fromRGBO(223, 223, 223, 1.0)),
                top: const BorderSide(
                    width: 1, color: Color.fromRGBO(223, 223, 223, 1.0))),
          ),
        )),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: val, color: Colors.white),
              right: const BorderSide(width: 1, color: Colors.white),
              left: const BorderSide(width: 1, color: Colors.white),
              top: const BorderSide(width: 1, color: Colors.white)),
        ),
      ),
    );
  }
}

class Pxlbtn extends StatelessWidget {
  const Pxlbtn({
    this.img,
    this.name,
    Key? key,
  }) : super(key: key);

  final img;
  final name;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          maincon.visibl.value = 0;
          maincon.pixelbtn.value = 0;
          maincon.retrobtn.value = 1;
          maincon.wavebtn.value = 1;
          maincon.title.value = "Pixel Art Wallpapers";
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 3, left: 4),
          child: Stack(
            children: [
              Container(
                height: 29.5,
                width: 81.5,
                decoration: BoxDecoration(
                  color: maincon.pixelbtn.value == 1
                      ? const Color.fromRGBO(192, 192, 192, 1.0)
                      : Colors.white,
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
                      color: maincon.pixelbtn.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    top: BorderSide(
                      width: 1.5,
                      color: maincon.pixelbtn.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    right: BorderSide(
                      width: maincon.pixelbtn.value == 1 ? 1.5 : 1,
                      color: maincon.pixelbtn.value == 1
                          ? Colors.black
                          : Colors.white,
                    ),
                    bottom: BorderSide(
                      width: maincon.pixelbtn.value == 1 ? 1.5 : 1,
                      color: maincon.pixelbtn.value == 1
                          ? Colors.black
                          : const Color.fromRGBO(192, 192, 192, 1.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 28,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(223, 223, 223, 1.0),
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
                      color: maincon.pixelbtn.value == 1
                          ? const Color.fromRGBO(223, 223, 223, 1.0)
                          : const Color.fromRGBO(128, 128, 128, 1.0),
                    ),
                    top: BorderSide(
                      width: 1.5,
                      color: maincon.pixelbtn.value == 1
                          ? const Color.fromRGBO(223, 223, 223, 1.0)
                          : const Color.fromRGBO(128, 128, 128, 1.0),
                    ),
                    right: BorderSide(
                      width: 1.5,
                      color: maincon.pixelbtn.value == 1
                          ? const Color.fromRGBO(128, 128, 128, 1.0)
                          : const Color.fromRGBO(223, 223, 223, 1.0),
                    ),
                    bottom: BorderSide(
                      width: 1.5,
                      color: maincon.pixelbtn.value == 1
                          ? const Color.fromRGBO(128, 128, 128, 1.0)
                          : const Color.fromRGBO(223, 223, 223, 1.0),
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Visibility(
                      visible: maincon.pixelbtn.value == 1 ? false : true,
                      child: Image.asset(
                        'lib/assets/meshback.png',
                        repeat: ImageRepeat.repeat,
                        width: 101,
                        height: 28,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            img,
                            scale: 0.7,
                          ),
                        ),
                        Text(name,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                letterSpacing: 0.0))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Rtrbtn extends StatelessWidget {
  const Rtrbtn({
    this.img,
    this.name,
    Key? key,
  }) : super(key: key);

  final img;
  final name;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          maincon.visibl.value = 1;
          maincon.retrobtn.value = 0;
          maincon.pixelbtn.value = 1;
          maincon.wavebtn.value = 1;
          maincon.title.value = "Retro Wallpapers";
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 3, left: 4),
          child: Stack(
            children: [
              Container(
                height: 29.5,
                width: 81.5,
                decoration: BoxDecoration(
                  color: maincon.retrobtn.value == 1
                      ? const Color.fromRGBO(192, 192, 192, 1.0)
                      : Colors.white,
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
                      color: maincon.retrobtn.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    top: BorderSide(
                      width: 1.5,
                      color: maincon.retrobtn.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    right: BorderSide(
                      width: maincon.retrobtn.value == 1 ? 1.5 : 1,
                      color: maincon.retrobtn.value == 1
                          ? Colors.black
                          : Colors.white,
                    ),
                    bottom: BorderSide(
                      width: maincon.retrobtn.value == 1 ? 1.5 : 1,
                      color: maincon.retrobtn.value == 1
                          ? Colors.black
                          : const Color.fromRGBO(192, 192, 192, 1.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 28,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(223, 223, 223, 1.0),
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
                      color: maincon.retrobtn.value == 1
                          ? const Color.fromRGBO(223, 223, 223, 1.0)
                          : const Color.fromRGBO(128, 128, 128, 1.0),
                    ),
                    top: BorderSide(
                      width: 1.5,
                      color: maincon.retrobtn.value == 1
                          ? const Color.fromRGBO(223, 223, 223, 1.0)
                          : const Color.fromRGBO(128, 128, 128, 1.0),
                    ),
                    right: BorderSide(
                      width: 1.5,
                      color: maincon.retrobtn.value == 1
                          ? const Color.fromRGBO(128, 128, 128, 1.0)
                          : const Color.fromRGBO(223, 223, 223, 1.0),
                    ),
                    bottom: BorderSide(
                      width: 1.5,
                      color: maincon.retrobtn.value == 1
                          ? const Color.fromRGBO(128, 128, 128, 1.0)
                          : const Color.fromRGBO(223, 223, 223, 1.0),
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Visibility(
                      visible: maincon.retrobtn.value == 1 ? false : true,
                      child: Image.asset(
                        'lib/assets/meshback.png',
                        repeat: ImageRepeat.repeat,
                        width: 101,
                        height: 28,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            img,
                            width: 17,
                            height: 17,
                          ),
                        ),
                        Text(name,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                letterSpacing: 0.0))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Wavebtn extends StatelessWidget {
  const Wavebtn({
    this.img,
    this.name,
    Key? key,
  }) : super(key: key);

  final img;
  final name;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          maincon.visibl.value = 2;
          maincon.wavebtn.value = 0;
          maincon.retrobtn.value = 1;
          maincon.pixelbtn.value = 1;
          maincon.title.value = "Vaporwave Wallpapers";
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 3, left: 4),
          child: Stack(
            children: [
              Container(
                height: 29.5,
                width: 81.5,
                decoration: BoxDecoration(
                  color: maincon.wavebtn.value == 1
                      ? const Color.fromRGBO(192, 192, 192, 1.0)
                      : Colors.white,
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
                      color: maincon.wavebtn.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    top: BorderSide(
                      width: 1.5,
                      color: maincon.wavebtn.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    right: BorderSide(
                      width: maincon.wavebtn.value == 1 ? 1.5 : 1,
                      color: maincon.wavebtn.value == 1
                          ? Colors.black
                          : Colors.white,
                    ),
                    bottom: BorderSide(
                      width: maincon.wavebtn.value == 1 ? 1.5 : 1,
                      color: maincon.wavebtn.value == 1
                          ? Colors.black
                          : const Color.fromRGBO(192, 192, 192, 1.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 28,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(223, 223, 223, 1.0),
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
                      color: maincon.wavebtn.value == 1
                          ? const Color.fromRGBO(223, 223, 223, 1.0)
                          : const Color.fromRGBO(128, 128, 128, 1.0),
                    ),
                    top: BorderSide(
                      width: 1.5,
                      color: maincon.wavebtn.value == 1
                          ? const Color.fromRGBO(223, 223, 223, 1.0)
                          : const Color.fromRGBO(128, 128, 128, 1.0),
                    ),
                    right: BorderSide(
                      width: 1.5,
                      color: maincon.wavebtn.value == 1
                          ? const Color.fromRGBO(128, 128, 128, 1.0)
                          : const Color.fromRGBO(223, 223, 223, 1.0),
                    ),
                    bottom: BorderSide(
                      width: 1.5,
                      color: maincon.wavebtn.value == 1
                          ? const Color.fromRGBO(128, 128, 128, 1.0)
                          : const Color.fromRGBO(223, 223, 223, 1.0),
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Visibility(
                      visible: maincon.wavebtn.value == 1 ? false : true,
                      child: Image.asset(
                        'lib/assets/meshback.png',
                        repeat: ImageRepeat.repeat,
                        width: 101,
                        height: 28,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            img,
                            width: 23,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(name,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                letterSpacing: 0.0))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StartMenu extends StatelessWidget {
  const StartMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (maincon.buttonclick.value == 1) {
            maincon.buttonclick.value = 0;
          } else {
            maincon.buttonclick.value = 1;
          }
        },
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 3, left: 4),
            child: Stack(
              children: [
                Container(
                  height: 29.5,
                  width: 74.5,
                  decoration: BoxDecoration(
                    color: maincon.buttonclick.value == 1
                        ? const Color.fromRGBO(192, 192, 192, 1.0)
                        : Colors.white,
                    border: Border(
                      left: BorderSide(
                        width: 1.5,
                        color: maincon.buttonclick.value == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                      top: BorderSide(
                        width: 1.5,
                        color: maincon.buttonclick.value == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                      right: BorderSide(
                        width: maincon.buttonclick.value == 1 ? 1.5 : 1,
                        color: maincon.buttonclick.value == 1
                            ? Colors.black
                            : Colors.white,
                      ),
                      bottom: BorderSide(
                        width: maincon.buttonclick.value == 1 ? 1.5 : 1,
                        color: maincon.buttonclick.value == 1
                            ? Colors.black
                            : const Color.fromRGBO(192, 192, 192, 1.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 28,
                  width: 73,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(223, 223, 223, 1.0),
                    border: Border(
                      left: BorderSide(
                        width: 1.5,
                        color: maincon.buttonclick.value == 1
                            ? const Color.fromRGBO(223, 223, 223, 1.0)
                            : const Color.fromRGBO(128, 128, 128, 1.0),
                      ),
                      top: BorderSide(
                        width: 1.5,
                        color: maincon.buttonclick.value == 1
                            ? const Color.fromRGBO(223, 223, 223, 1.0)
                            : const Color.fromRGBO(128, 128, 128, 1.0),
                      ),
                      right: BorderSide(
                        width: 1.5,
                        color: maincon.buttonclick.value == 1
                            ? const Color.fromRGBO(128, 128, 128, 1.0)
                            : const Color.fromRGBO(223, 223, 223, 1.0),
                      ),
                      bottom: BorderSide(
                        width: 1.5,
                        color: maincon.buttonclick.value == 1
                            ? const Color.fromRGBO(128, 128, 128, 1.0)
                            : const Color.fromRGBO(223, 223, 223, 1.0),
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Visibility(
                        visible: maincon.buttonclick.value == 1 ? false : true,
                        child: Image.asset(
                          'lib/assets/meshback.png',
                          repeat: ImageRepeat.repeat,
                          width: 73,
                          height: 28,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(
                              'lib/assets/windows-4.png',
                              scale: 0.7,
                            ),
                          ),
                          Text("Start",
                              style: GoogleFonts.vt323(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  letterSpacing: 0.0))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Taskbar extends StatelessWidget {
  const Taskbar({
    @required this.Child,
    @required this.Height,
    Key? key,
  }) : super(key: key);

  final Child;
  final Height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: Height,
            width: Get.width,
            color: const Color.fromRGBO(192, 192, 192, 1.0),
            child: Child),
        Padding(
          padding: const EdgeInsets.only(top: 1.3),
          child: Container(
            height: 1,
            width: Get.width,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    @required this.Child,
    Key? key,
  }) : super(key: key);

  final Child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 35,
            width: Get.width,
            color: const Color.fromRGBO(192, 192, 192, 1.0),
            child: Child),
        Padding(
          padding: const EdgeInsets.only(top: 33.7),
          child: Container(
            height: 1,
            width: Get.width,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Pxlminebtn extends StatelessWidget {
  const Pxlminebtn({
    this.img,
    this.name,
    Key? key,
  }) : super(key: key);

  final img;
  final name;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          maincon.pixelminebtn.value = 1;

          maincon.title.value = "Mincraft Pixel Art Wallpapers";
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 3, left: 4),
          child: Stack(
            children: [
              Container(
                height: 29.5,
                width: 121.5,
                decoration: BoxDecoration(
                  color: maincon.pixelminebtn.value == 1
                      ? const Color.fromRGBO(192, 192, 192, 1.0)
                      : Colors.white,
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
                      color: maincon.pixelminebtn.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    top: BorderSide(
                      width: 1.5,
                      color: maincon.pixelminebtn.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    right: BorderSide(
                      width: maincon.pixelminebtn.value == 1 ? 1.5 : 1,
                      color: maincon.pixelminebtn.value == 1
                          ? Colors.black
                          : Colors.white,
                    ),
                    bottom: BorderSide(
                      width: maincon.pixelminebtn.value == 1 ? 1.5 : 1,
                      color: maincon.pixelminebtn.value == 1
                          ? Colors.black
                          : const Color.fromRGBO(192, 192, 192, 1.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 28,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(223, 223, 223, 1.0),
                  border: Border(
                    left: BorderSide(
                      width: 1.5,
                      color: maincon.pixelminebtn.value == 1
                          ? const Color.fromRGBO(223, 223, 223, 1.0)
                          : const Color.fromRGBO(128, 128, 128, 1.0),
                    ),
                    top: BorderSide(
                      width: 1.5,
                      color: maincon.pixelminebtn.value == 1
                          ? const Color.fromRGBO(223, 223, 223, 1.0)
                          : const Color.fromRGBO(128, 128, 128, 1.0),
                    ),
                    right: BorderSide(
                      width: 1.5,
                      color: maincon.pixelminebtn.value == 1
                          ? const Color.fromRGBO(128, 128, 128, 1.0)
                          : const Color.fromRGBO(223, 223, 223, 1.0),
                    ),
                    bottom: BorderSide(
                      width: 1.5,
                      color: maincon.pixelminebtn.value == 1
                          ? const Color.fromRGBO(128, 128, 128, 1.0)
                          : const Color.fromRGBO(223, 223, 223, 1.0),
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Visibility(
                      visible: maincon.pixelminebtn.value == 1 ? false : true,
                      child: Image.asset(
                        'lib/assets/meshback.png',
                        repeat: ImageRepeat.repeat,
                        width: 101,
                        height: 28,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            img,
                            scale: 0.7,
                          ),
                        ),
                        Text(name,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                letterSpacing: 0.0))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
