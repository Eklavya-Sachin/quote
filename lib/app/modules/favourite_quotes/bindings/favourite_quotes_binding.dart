import 'package:get/get.dart';

import '../controllers/favourite_quotes_controller.dart';

class FavouriteQuotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouriteQuotesController>(
      () => FavouriteQuotesController(),
    );
  }
}
