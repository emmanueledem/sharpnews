import 'package:logger/logger.dart';
import 'package:sharpnews/core/networks/api_request.dart';

abstract class NewsService {
  Future getNews();
}

class NewsServiceImplementaion implements NewsService {
  final ApiServiceRequester _apiServiceRequester = ApiServiceRequester();

  @override
  Future getNews() async {
    try {
      final response = await _apiServiceRequester.getRequest(
          url:
              'v2/everything?q=tesla&from=2022-05-08&sortBy=publishedAt&apiKey=b7b34907627643a3a46aef6920305176');
      return response;
    } catch (e) {
      Logger().d('$e');
    }
  }
}
