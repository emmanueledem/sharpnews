

import '../base_view_model.dart';

class NewsProvider extends BaseViewModel {

  Future<void> fetchNews() async {
    setBusy(true);
    setBusy(false);
  }
}
