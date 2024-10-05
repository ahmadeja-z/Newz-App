import 'dart:async';

import 'package:get/get.dart';

import '../resources/routes/routes_name.dart';


class SplashServices {
static  void isLogin() {
    Timer(Duration(seconds: 3), () {
      Get.toNamed(RouteName.homeScreen);
    });
  }
}
