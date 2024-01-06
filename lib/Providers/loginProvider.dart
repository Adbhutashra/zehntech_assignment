import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zehntech_assignment/Network/repo.dart';
import 'package:zehntech_assignment/Presentation/homeScreen.dart';

class LoginProvider extends ChangeNotifier {
  bool isLogin = false;
  var loginFormKey = GlobalKey<FormState>();
  var userNameCtr = TextEditingController();
  var userNameFocus = FocusNode();
   var passWordCtr = TextEditingController();
  var passWordFocus = FocusNode();
  bool isVisible = true;

  userFocus() {
    userNameFocus;
    notifyListeners();
  }

  passIsVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  passFocus() {
    passWordFocus;
    notifyListeners();
  }

  void submitLogin(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      await Repository.loginRepo(
              username: userNameCtr.text, password: passWordCtr.text)
          .then((value) {
  

        if (value!.statusCode == 200) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Login SuccessFully")));
          Get.off(() => const HomeScreen());
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
        }
      });
    }
    notifyListeners();
  }
}
