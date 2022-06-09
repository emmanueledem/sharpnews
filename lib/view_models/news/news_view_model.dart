import 'package:sharpnews/model/news_model.dart';
import 'package:sharpnews/services/news_service.dart';
import '../base_view_model.dart';

class NewsViewModel extends BaseViewModel {
  final NewsServiceImplementaion _newsService = NewsServiceImplementaion();
  List<NewsModel>? _newsData;
  List<NewsModel>? get newsData => _newsData;


  Future<void> init() async {
    await getNews();
  }

  Future<void> getNews() async {
    setBusy(true);
    final response = await _newsService.getNews();
    var responseData = <NewsModel>[];
    for (var item in response.data['articles']) {
      responseData.add(NewsModel.fromJson(item));
    }
    _newsData = responseData;

    setBusy(false);
  }
}
