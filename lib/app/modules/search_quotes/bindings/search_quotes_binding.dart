import 'package:get/get.dart';

import '../controllers/search_quotes_controller.dart';

class SearchQuotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchQuotesController>(
      () => SearchQuotesController(),
    );
  }
}
