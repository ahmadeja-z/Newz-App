import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:updatingnewz/app/resources/colors/colors.dart';
import 'package:updatingnewz/app/screen_controllers/home_controller.dart';
import 'package:updatingnewz/app/screens/categories/categories_tab_screen.dart';

import '../data/api_response/status.dart';
import '../resources/components/custom_app_bar.dart';
import '../resources/components/headline_info_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Make selectedList reactive
  final Rx<FilterList?> selectedList = Rx<FilterList?>(FilterList.bbcNews);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        trailing: Obx(() => PopupMenuButton<FilterList>(
          initialValue: selectedList.value,
          onSelected: (FilterList item) {
            // Update selectedList reactively
            selectedList.value = item;

            // Fetch the corresponding news based on the selection
            switch (item) {
              case FilterList.bbcNews:
                controller.bbcHeadlineNewsFetch();
                break;
              case FilterList.abcNews:
                controller.abcHeadlineNewsFetch();
                break;
              case FilterList.jazeeraNews:
                controller.jazeeraHeadlineFetch();
                break;
              case FilterList.aryNews:
                controller.aryHeadlineFetch();
                break;
              case FilterList.cbsNews:
                controller.cbsHeadlineFetch();
                break;
              case FilterList.argaamNews:
                controller.argaamHeadlineFetch();
                break;
            }
          },
          icon: Icon(
            Icons.more_vert,
            color: AppColors.black,
          ),
          itemBuilder: (context) => <PopupMenuItem<FilterList>>[
            const PopupMenuItem<FilterList>(
              value: FilterList.bbcNews,
              child: Text('BBC News'),
            ),
            const PopupMenuItem<FilterList>(
              value: FilterList.abcNews,
              child: Text('ABC News'),
            ),
            const PopupMenuItem<FilterList>(
              value: FilterList.jazeeraNews,
              child: Text('Jareera News'),
            ),
            const PopupMenuItem<FilterList>(
              value: FilterList.aryNews,
              child: Text('ARY News'),
            ),
            const PopupMenuItem<FilterList>(
              value: FilterList.cbsNews,
              child: Text('CBS News'),
            ),
            const PopupMenuItem<FilterList>(
              value: FilterList.argaamNews,
              child: Text('Argaam News'),
            ),
          ],
        )),
        onLeadingTap: (){Get.to(CategoriesTabScreen());},
        title: 'News',
        leading: Icon(
          Icons.apps,
          size: 23.r,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(() {
              var currentResponse;

              // Reactively use selectedList to determine the current news response
              switch (selectedList.value) {
                case FilterList.bbcNews:
                  currentResponse = controller.bbcNews.value;
                  break;
                case FilterList.abcNews:
                  currentResponse = controller.abcNews.value;
                  break;
                case FilterList.jazeeraNews:
                  currentResponse = controller.jazeeraNews.value;
                  break;
                case FilterList.aryNews:
                  currentResponse = controller.aryNews.value;
                  break;
                case FilterList.cbsNews:
                  currentResponse = controller.cbsNews.value;
                  break;
                case FilterList.argaamNews:
                  currentResponse = controller.argaamNews.value;
                  break;
                default:
                  currentResponse = controller.bbcNews.value;
                  break;
              }

              switch (currentResponse.status) {
                case Status.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.COMPLETED:
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: currentResponse?.data.articles?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = currentResponse?.data.articles?[index];
                      if (data == null) {
                        return const SizedBox.shrink(); // Handle null cases
                      }
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: HeadlineBox(
                          image: data.urlToImage ?? '',
                          news: data.description ?? 'No Description',
                          date: data.publishedAt ?? 'No Date',
                          channel: data.source?.name ?? 'Unknown Source',
                        ),
                      );
                    },
                  );
                case Status.ERROR:
                  return Center(
                    child: Text(
                      controller.bbcNews.value.message.toString(),
                    ),
                  );
                default:
                  return const SizedBox.shrink(); // Handle any undefined state
              }
            }),
          ),
        ],
      ),
    );
  }
}

enum FilterList { bbcNews, abcNews, jazeeraNews, aryNews, cbsNews, argaamNews }
