import 'package:get/get.dart';
import 'package:updatingnewz/app/data/api_response/api_response.dart';
import 'package:updatingnewz/app/models/categories_model.dart';
import 'package:updatingnewz/app/repository/categories_repo.dart';

class CategoriesController extends GetxController {
  var selectedIndex = 0.obs;

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchEntertainmentResponse();
    fetchHealthResponse();
    fetchGeneralResponse();
    fetchScienceResponse();
    fetchSportResponse();
    fetchTechnologyResponse();
  }

  CategoriesRepo repo = CategoriesRepo();
  var generalResponse = ApiResponse.loading().obs;
  var healthResponse = ApiResponse.loading().obs;
  var scienceResponse = ApiResponse.loading().obs;
  var sportsResponse = ApiResponse.loading().obs;
  var technologyResponse = ApiResponse.loading().obs;
  var entertainmentResponse = ApiResponse.loading().obs;

  void fetchGeneralResponse() async {
    generalResponse.value = ApiResponse.loading();
    try {
      var data = await repo.fetchGeneral();
      var general = CategoriesModel.fromJson(data);

      generalResponse.value = ApiResponse.completed(general);
    } catch (e) {
      generalResponse.value = ApiResponse.error(e.toString());
    }
  }

  void fetchHealthResponse() async {
    healthResponse.value = ApiResponse.loading();
    try {
      var data = await repo.fetchHealth();
      var health = CategoriesModel.fromJson(data);
      healthResponse.value = ApiResponse.completed(health);
      print(ApiResponse.completed(health));
    } catch (e) {
      healthResponse.value = ApiResponse.error(e.toString());
    }
  }

  void fetchScienceResponse() async {
    scienceResponse.value = ApiResponse.loading();
    try {
      var data = await repo.fetchScience();
      var science = CategoriesModel.fromJson(data);
      scienceResponse.value = ApiResponse.completed(science);
    } catch (e) {
      scienceResponse.value = ApiResponse.error(e.toString());
    }
  }

  void fetchSportResponse() async {
    sportsResponse.value = ApiResponse.loading();
    try {
      var data = await repo.fetchSports();
      var sports = CategoriesModel.fromJson(data);
      sportsResponse.value = ApiResponse.completed(sports);
    } catch (e) {
      sportsResponse.value = ApiResponse.error(e.toString());
    }
  }

  void fetchTechnologyResponse() async {
    technologyResponse.value = ApiResponse.loading();
    try {
      var data = await repo.fetchTechnology();
      var technology = CategoriesModel.fromJson(data);
      technologyResponse.value = ApiResponse.completed(technology);
    } catch (e) {
      technologyResponse.value = ApiResponse.error(e.toString());
    }
  }

  void fetchEntertainmentResponse() async {
    entertainmentResponse.value = ApiResponse.loading();
    try {
      var data = await repo.fetchEntertainment();
      var entertainment = CategoriesModel.fromJson(data);
      entertainmentResponse.value = ApiResponse.completed(entertainment);
    } catch (e) {
      entertainmentResponse.value = ApiResponse.error(e.toString());
    }
  }
}
