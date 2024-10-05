import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:updatingnewz/app/resources/assets/fonts/app_fonts.dart';
import 'package:updatingnewz/app/resources/colors/colors.dart';
import 'package:updatingnewz/app/screens/categories/tabs/general_categories_view.dart';
import 'package:updatingnewz/app/screens/categories/tabs/health_categories_view.dart';

class CategoriesTabScreen extends StatelessWidget {
  CategoriesTabScreen({super.key});

  final List<Tab> myTab = <Tab>[
    const Tab(text: 'General'),
    const Tab(text: 'Entertainment'),
    const Tab(text: 'Health'),
    const Tab(text: 'Sports'),
    const Tab(text: 'Business'),
    const Tab(text: 'Technology'),
  ];

  final List<Widget> tabContent = [
    GeneralCategoriesView(),
    const Center(child: Text('Entertainment News')),
    HealthCategoriesView(),
    const Center(child: Text('Sports News')),
    const Center(child: Text('Business News')),
    const Center(child: Text('Technology News')),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(CupertinoIcons.back)),
          centerTitle: true,
          title: Text(
            'Categories',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.poppins,
                fontSize: 17.sp),
          ),
          bottom: TabBar(
            dividerHeight: 0,
            labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            labelStyle: const TextStyle(
              fontFamily: AppFonts.poppins,
              color: AppColors.white,
              // fontWeight: FontWeight.bold,
            ),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: AppColors.blue),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: myTab,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: tabContent,
        ),
      ),
    );
  }
}
