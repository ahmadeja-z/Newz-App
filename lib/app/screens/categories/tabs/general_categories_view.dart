import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:updatingnewz/app/data/api_response/api_response.dart';
import 'package:updatingnewz/app/resources/components/categories_container.dart';
import 'package:updatingnewz/app/screen_controllers/categories/categories_tab_controller.dart';

import '../../../data/api_response/status.dart';

class GeneralCategoriesView extends StatelessWidget {
  const GeneralCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    return Scaffold(
      body: Obx(() {
        switch (controller.generalResponse.value.status) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case Status.COMPLETED:
            return ListView.separated(
              itemBuilder: (context, index) {
                final article = controller.generalResponse.value.data.articles[index];

                return CategoriesContainer(
                  news: article.title ?? 'No Title',
                  imageUrl: article.urlToImage ?? '',
                  channel: article.source?.name ?? 'Unknown Source',
                  date: article.publishedAt ?? 'No Date',
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: controller.generalResponse.value.data.articles.length, // Corrected length usage
            );

          case Status.ERROR:
            return Center(
              child: Text(controller.generalResponse.value.message ?? 'An error occurred'),
            );

          default:
            return const SizedBox.shrink();
        }
      }),
    );
  }
}
