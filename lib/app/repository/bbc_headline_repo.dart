import 'package:updatingnewz/app/data/api_response/api_response.dart';
import 'package:updatingnewz/app/data/network/network_api_services.dart';
import 'package:updatingnewz/app/resources/url/app_url.dart';

class HeadlineRepo{
final NetworkApiServices _networkApiServices=NetworkApiServices();
Future<dynamic>bbcHeadline()async{
try{

dynamic apiResponse=await _networkApiServices.getApi(AppUrl.bbcHeadline);
print('APi response $apiResponse');
return apiResponse;
}catch(e){
  print('Api response failed: ${e.runtimeType}: $e');
  rethrow;
}
}

Future<dynamic>abcHeadline()async{
 try{
   dynamic response=await _networkApiServices.getApi(AppUrl.abcHeadline);
   return response;

 }catch(e){
   print('Api response failed: ${e.runtimeType}: $e');
rethrow;
 }
}
Future<dynamic>jazeeraHeadline()async{
  try{
    dynamic response=await _networkApiServices.getApi(AppUrl.alJazeeraHeadline);
    return response;
  }catch(e){
    print(e);
    rethrow;
  }
}
Future<dynamic> aryHeadline()async{
try{
  dynamic response=await _networkApiServices.getApi(AppUrl.aryHeadline);
  return response;
}catch(e){
  print(e);
  rethrow;
}
}
Future<dynamic>argaamHeadline()async{
  try{dynamic response=await _networkApiServices.getApi(AppUrl.aryHeadline);
  return response;}
catch(e){
    print(e.toString());
    rethrow;
}}
Future<dynamic> cbsNews()async{
  try{
    dynamic response=await _networkApiServices.getApi(AppUrl.cbcHeadline);
    return response;
  }catch(e){
    print(e);
    rethrow;
  }
}

}