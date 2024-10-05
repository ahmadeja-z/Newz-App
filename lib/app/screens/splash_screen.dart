import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../resources/assets/images/app_images.dart';
import '../resources/colors/colors.dart';
import '../services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    SplashServices.isLogin();
    super.initState();
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png',fit: BoxFit.contain,height: 300.h,width: double.infinity,),
          SizedBox(height: 30.h,),
          SpinKitCircle(
            color: AppColors.blue,
          )
        ],
      ),
    );
  }
}
