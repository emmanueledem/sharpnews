import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharpnews/core/errors/exceptions.dart';
import 'package:sharpnews/core/networks/network_info.dart';

class ApiServiceRequester {
  // used for ApI calls

  late  final Dio dio;
  final NetworkInfoImpl _connectivityInfo = NetworkInfoImpl();
    // String? baseUrl = dotenv.env[BASE_URL];

  // get request
  Future<Response> getRequest({required String url}) async {
    if (await _connectivityInfo.isConnected) {
        var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      
      try {
        final response = await dio.get(url);
          // baseUrl! + url,
        return response;
      } catch (e) {
        throw Exception();
      }
    } else {
      throw NoInternetException();
      //  Throw error
    }
  }
  // post request
  Future<Response> postRequest(
      {required String url, required dynamic body}) async {

        var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

         dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

    if (await _connectivityInfo.isConnected) {
      try {
        final response = await dio.post(
          'http://www.dtworkroom.com/doris/1/2.0.0/test',
          data: {'aa': 'bb' * 22},
         
        //    baseUrl! + url,
        // data: body,
        );
        return response;
      } catch (e) {
        print(e);
        throw Exception();
      }
    } else {
      throw NoInternetException();
      //  Throw error
    }
  }

  
}
