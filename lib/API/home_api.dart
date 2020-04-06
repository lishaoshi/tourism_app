import '../dio/dio_config.dart';
import 'package:dio/dio.dart';
import '../model/home_model.dart';

 Http http = Http();
class HomeApi {
 
  static getHomeData() async{
    final String url = 'https://apk-1256738511.file.myqcloud.com/FlutterTrip/data/home_page.json';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}