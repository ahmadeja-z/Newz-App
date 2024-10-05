import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../assets/fonts/app_fonts.dart';
import '../colors/colors.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key, required this.news, required this.imageUrl, required this.channel, required this.date});
  final String news;
  final String imageUrl;
  final String channel;
  final String date;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 160.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Container(
            height: 160.h,
            width: 110.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 50.w,
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 40.w,
              ),
            ),
          ),
          SizedBox(width: 12.w), // Spacing between image and text
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween
              ,
              children: [
                // Headline
                Text(
news,                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: AppFonts.poppins,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                // Details Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Source
                    Text(
                      channel,
                      style: TextStyle(
                        fontFamily: AppFonts.poppins,
                        color: AppColors.grey,
                        fontSize: 10.sp,
                      ),
                    ),
                    // Date
                    Text(
                      formatDate(date),
                      style: TextStyle(
                        fontFamily: AppFonts.poppins,
                        color: AppColors.black,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  String formatDate(String apiDate) {
    // Parse the API date string
    DateTime dateTime = DateTime.parse(apiDate);
    // Format the date to "Month Day, Year"
    return DateFormat('MMMM dd, yyyy').format(dateTime);
  }
}
