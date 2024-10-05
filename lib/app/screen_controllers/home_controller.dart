import 'package:get/get.dart';
import 'package:updatingnewz/app/data/api_response/api_response.dart';
import 'package:updatingnewz/app/models/news_headline_model.dart';
import 'package:updatingnewz/app/repository/bbc_headline_repo.dart';

class HomeController extends GetxController {
  HeadlineRepo repo = HeadlineRepo();

  @override
  void onInit() {
    super.onInit();
    bbcHeadlineNewsFetch();
    abcHeadlineNewsFetch();
    jazeeraHeadlineFetch();
    aryHeadlineFetch();
    cbsHeadlineFetch();
    argaamHeadlineFetch();
  }

  var bbcNews = ApiResponse<HeadlineModel>.loading().obs;
  var abcNews = ApiResponse<HeadlineModel>.loading().obs;
  var jazeeraNews = ApiResponse<HeadlineModel>.loading().obs;
  var aryNews = ApiResponse<HeadlineModel>.loading().obs;
  var cbsNews = ApiResponse<HeadlineModel>.loading().obs;
  var argaamNews = ApiResponse<HeadlineModel>.loading().obs;

  void bbcHeadlineNewsFetch() async {
    ApiResponse.loading();
    try {
      var response = await repo.bbcHeadline();
      var headlines = HeadlineModel.fromJson(response);
      print('fetch headline$headlines');
      bbcNews.value = ApiResponse.completed(headlines);
    } catch (e) {
      bbcNews.value = ApiResponse.error(e.toString());
    }
  }

  void abcHeadlineNewsFetch() async {
    try {
      var response = await repo.abcHeadline();
      var headline = HeadlineModel.fromJson(response);
      abcNews.value = ApiResponse.completed(headline);
    } catch (e) {
      abcNews.value = ApiResponse.error(e.toString());
    }
  }

  void jazeeraHeadlineFetch() async {
    try {
      var response = await repo.jazeeraHeadline();
      var headline = HeadlineModel.fromJson(response);
      jazeeraNews.value = ApiResponse.completed(headline);
    } catch (e) {
      jazeeraNews.value = ApiResponse.error(e.toString());
    }
  }

  void aryHeadlineFetch() async {
    try {
      var response = await repo.aryHeadline();
      var headline = HeadlineModel.fromJson(response);
      aryNews.value = ApiResponse.completed(headline);
    } catch (e) {
      aryNews.value = ApiResponse.error(e.toString());
    }
  }

  void cbsHeadlineFetch() async {
    try {
      var response = await repo.cbsNews();
      var headline = HeadlineModel.fromJson(response);
      cbsNews.value = ApiResponse.completed(headline);
    } catch (e) {
      cbsNews.value = ApiResponse.error(e.toString());
    }
  }

  void argaamHeadlineFetch() async {
    try {
      var response = await repo.argaamHeadline();
      var headline = HeadlineModel.fromJson(response);
      argaamNews.value = ApiResponse.completed(headline);
    } catch (e) {
      argaamNews.value = ApiResponse.error(e.toString());
    }
  }
}
