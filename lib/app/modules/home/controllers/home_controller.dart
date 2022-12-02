import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  void goToAuthorQuoteSearch() {
    Get.toNamed(Routes.SEARCH_AUTHOR_QUOTE);
  }

  void goToQuotesSearch() {
    Get.toNamed(Routes.SEARCH_QUOTES);
  }

  void goToFavouriteQuotes() {
    Get.toNamed(Routes.FAVOURITE_QUOTES);
  }
}
