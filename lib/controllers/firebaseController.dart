// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Firebasecon extends GetxController {
  var pixelList = [].obs;
  var pixelMineList = [].obs;
  var pixelLandscape = [].obs;
  var pixelAnime = [].obs;
  var retroList = [].obs;
  var waveList = [].obs;

  getpixel() async {
    // ignore: non_constant_identifier_names
    var Index = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('pixel').get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];
      Index.add(documentSnapshot.data());
    }

    for (int i = 0; i < Index.length; i++) {
      pixelList.add(Index[i].values.toList()[1]);
    }
  }

  getRetro() async {
    // ignore: non_constant_identifier_names
    var Index = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('retro').get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];
      Index.add(documentSnapshot.data());
    }

    for (int i = 0; i < Index.length; i++) {
      retroList.add(Index[i].values.toList()[0]);
    }
  }

  getWave() async {
    // ignore: non_constant_identifier_names
    var Index = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('wave').get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];
      Index.add(documentSnapshot.data());
    }

    for (int i = 0; i < Index.length; i++) {
      waveList.add(Index[i].values.toList()[0]);
    }
  }

  getPixelMinecraft() async {
    // ignore: non_constant_identifier_names
    var Index = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pixel')
        .where("cat", arrayContains: 'minecraft')
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];
      Index.add(documentSnapshot.data());
    }

    for (int i = 0; i < Index.length; i++) {
      pixelMineList.add(Index[i].values.toList()[1]);
    }
  }

  getPixelLandscape() async {
    // ignore: non_constant_identifier_names
    var Index = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pixel')
        .where("cat", arrayContains: 'landscape')
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];
      Index.add(documentSnapshot.data());
    }

    for (int i = 0; i < Index.length; i++) {
      pixelLandscape.add(Index[i].values.toList()[1]);
    }
  }

  getPixelAnime() async {
    // ignore: non_constant_identifier_names
    var Index = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pixel')
        .where("cat", arrayContains: 'anime')
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs[i];
      Index.add(documentSnapshot.data());
    }

    for (int i = 0; i < Index.length; i++) {
      pixelAnime.add(Index[i].values.toList()[1]);
    }
  }
}
