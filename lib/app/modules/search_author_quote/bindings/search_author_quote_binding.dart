import 'package:get/get.dart';

import '../controllers/search_author_quote_controller.dart';

class SearchAuthorQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchAuthorQuoteController>(
      () => SearchAuthorQuoteController(),
    );
  }
}
