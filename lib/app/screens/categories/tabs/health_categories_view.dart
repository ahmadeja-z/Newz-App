import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:updatingnewz/app/resources/components/categories_container.dart';
import 'package:updatingnewz/app/screen_controllers/categories/categories_tab_controller.dart';

import '../../../data/api_response/status.dart';

class HealthCategoriesView extends StatelessWidget {
  const HealthCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    return Scaffold(
      body: Obx(
            () {
          switch (controller.healthResponse.value.status) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
            case Status.COMPLETED:
              return ListView.separated(
                itemBuilder: (context, index) {
                  final news = controller.healthResponse.value.data.articles[index];

                  // Handle null values using ?? operator
                  return CategoriesContainer(
                    news: news.title ?? 'No title available',
                    imageUrl: news.urlToImage ?? 'https://via.placeholder.com/150', // Provide a placeholder URL
                    channel: news.source.name ?? 'Unknown source',
                    date: news.publishedAt ?? 'Unknown date',
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.healthResponse.value.data.articles.length,
              );
            case Status.ERROR:
              return Center(
                child: Text(controller.healthResponse.value.message.toString()),
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
