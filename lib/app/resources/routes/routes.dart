import 'package:get/get.dart';
import 'package:updatingnewz/app/resources/routes/routes_name.dart';


import '../../screens/home_screen;.dart';
import '../../screens/splash_screen.dart';

class AppRoute{
  static appRoute()=>[
    GetPage(name: RouteName.splashScreen, page:() =>const  SplashScreen(),),
    GetPage(name: RouteName.homeScreen, page: () => HomeScreen(),)
  ];
}