import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../assets/fonts/app_fonts.dart';
import '../colors/colors.dart';

class HeadlineBox extends StatelessWidget {
  const HeadlineBox(
      {super.key,
        required this.image,
        required this.news,
        required this.date,
        required this.channel});
  final String image;
  final String news;
  final String date;
  final String channel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 380.h,
          width: 280.w,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15).w),
          child: CachedNetworkImage(imageUrl:image,
            fit: BoxFit.cover,
            placeholder: (context,url){
              return const Center(
                child: SpinKitCircle(color: AppColors.blue,),

              );
            },
            errorWidget: (context, url, error) => const Icon(Icons.error_outline,color: Colors.red,),
          ),
        ),

        Positioned(
          bottom: 10,
          child: Container(
            height: 130.h,
            width: 240.w,
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsetsDirectional.all(10.r),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(13.r)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    news,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.black,
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        channel,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue,
                            fontSize: 10.sp,
                            fontFamily: AppFonts.poppins),
                      ),
                      Text(
                        formatDate(date),
                        style: TextStyle(
              
                            fontSize: 10.sp,
                            color: AppColors.black,
                            fontFamily: AppFonts.poppins),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  String formatDate(String apiDate) {
    // Parse the API date string
    DateTime dateTime = DateTime.parse(apiDate);
    // Format the date to "Month Day, Year"
    return DateFormat('MMMM dd, yyyy').format(dateTime);
  }
}