import 'package:updatingnewz/app/data/network/network_api_services.dart';
import 'package:updatingnewz/app/resources/url/app_url.dart';

class CategoriesRepo {
  NetworkApiServices _services=NetworkApiServices();

  Future<dynamic> fetchGeneral()async{
    try{
      dynamic response=await _services.getApi(AppUrl.generalCategories);
      return response;
    }catch(e){
      print('Repo Fetch Error $e');
      rethrow;
    }
  }
  Future<dynamic>fetchHealth()async{
    try{
      dynamic response=await _services.getApi(AppUrl.healthCategories);
      return response;
    }catch(e){
      print('Repo Fetch Error $e');
      rethrow;
    }
  }
  Future<dynamic>fetchEntertainment()async{
    try{
      dynamic response=await _services.getApi(AppUrl.entertainmentCategories);
      return response;
    }catch(e){
      print('Repo Fetch Error $e');
      rethrow;
    }
  }
  Future<dynamic>fetchScience()async{
    try{
      dynamic response =await _services.getApi(AppUrl.scienceCategories);
      return response;
    }catch(e){
      print('Repo Fetch Error $e');
      rethrow;
    }
  }
  Future<dynamic>fetchSports()async{
    try{
      dynamic response=await _services.getApi(AppUrl.sportsCategories);
      return response;
    }catch(e){  print('Repo Fetch Error $e');
    rethrow;}
  }
  Future<dynamic>fetchTechnology()async{
    try{
      dynamic response=await _services.getApi(AppUrl.technologyCategories);
      return response;
    }catch(e){  print('Repo Fetch Error $e');
    rethrow;}
  }

}