import 'package:dio/dio.dart';
import './dio_interckpt.dart';


/*
 * 配置请求头
 */

BaseOptions options = BaseOptions(
  baseUrl: '',
  connectTimeout: 5000,
  receiveTimeout: 3000,
  // headers: {
  //   'contentType': Headers.formUrlEncodedContentType
  // }
);

Dio dio = Dio(options);




class Http {

  // Dio _dio = Dio();
  ///通用的GET请求
  get(url, {params,noTip = false}) async {
    Response response;
    try {
      response = await dio.get(url);
    } on DioError catch (e) {
      return e;
    }

    if (response.data is DioError) {
      return response.data;
    }

    return response;
  }

  ///通用的POST请求
  post(url, params, {noTip = false}) async {
    Response response;

    try {
      response = await dio.post(url, data: params);
    } on DioError catch (e) {
      return e;
    }

    if (response.data is DioError) {
      return response.data;
    }

    return response.data;
  }
}
//http拦截器
