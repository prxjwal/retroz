// ignore_for_file: file_names

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:retroz/controllers/firebaseController.dart';

final firebaseController = Get.put(Firebasecon());

class MainController extends GetxController {
  var popupbtn = 0.obs;
  var buttonclick = 1.obs;
  var visibl = 0.obs;
  var menubtn = 1.obs;
  var pixelbtn = 0.obs;
  var retrobtn = 1.obs;
  var title = "Pixel Art Wallpaper".obs;
  var wavebtn = 1.obs;

  var pixelminebtn = 0.obs;
  var pixellandscapebtn = 1.obs;
  var pixelanimebtn = 2.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    firebaseController.getpixel();
    firebaseController.getRetro();
    firebaseController.getWave();
    firebaseController.getPixelMinecraft();
    firebaseController.getPixelLandscape();
    firebaseController.getPixelAnime();
    super.onInit();
  }

  Future<void> initAppState() async {
    String platformVersion;
    String _heightWidth;

    try {
      platformVersion =
          await WallpaperManager.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      int height = await WallpaperManager.getDesiredMinimumHeight();
      int width = await WallpaperManager.getDesiredMinimumWidth();
      _heightWidth =
          "Width = " + width.toString() + " Height = " + height.toString();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      _heightWidth = "Failed to get Height and Width";
    }
  }

  Future<void> setWallpaper(String URL) async {
    try {
      isLoading.value = true;
      String url = URL;
      int location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
      Get.back();
      isLoading.value = false;
    } on PlatformException {}
  }

  Future<void> setWallpaperLock(String URL) async {
    try {
      isLoading.value = true;
      String url = URL;
      int location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);

      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      isLoading.value = false;
      print(result);
      Get.back();
    } on PlatformException {}

    Future<void> setWallpaperBoth(String URL) async {
      try {
        isLoading.value = true;
        String url = URL;
        int location = WallpaperManager.BOTH_SCREEN;
        var file = await DefaultCacheManager().getSingleFile(url);
        final bool result =
            await WallpaperManager.setWallpaperFromFile(file.path, location);
        isLoading.value = false;
        print(result);
        Get.back();
      } on PlatformException {}
    }
  }

  Future<void> ResetWall() async {
    try {
      isLoading.value = true;
      final bool result = await WallpaperManager.clearWallpaper();
      isLoading.value = false;
      print(result);
    } on PlatformException {}
  }
}
