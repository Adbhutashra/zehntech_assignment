import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zehntech_assignment/Model/homeModel.dart';
import 'package:zehntech_assignment/Network/repo.dart';
import 'package:zehntech_assignment/Presentation/loginScreen.dart';

class HomeProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  final List<IconData> iconList = [
    Icons.arrow_back_ios,
    Icons.emoji_emotions,
    Icons.face,
    Icons.face_3,
    Icons.emoji_emotions_rounded ,
    Icons.arrow_forward_ios,
  ];

  var homeModel = HomeModel();
  bool isLoading = true;

  loadUpdate(isLoad) {
    isLoading = isLoad;
    notifyListeners();
  }

  
  Future<void> fetchUsersList() async {
    isLoading = true;
    await Repository.usersRepo().then((value) {
      var decodeData = value!.body;
      final decode = json.decode(decodeData);
      homeModel = HomeModel.fromJson(decode);
    
      loadUpdate(false);
    });
    notifyListeners();
  }

  logOut() {
    Get.offAll(() => const LoginScreen());
  }
}
