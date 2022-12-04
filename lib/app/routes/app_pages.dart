// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import '../modules/favourite_quotes/bindings/favourite_quotes_binding.dart';
import '../modules/favourite_quotes/views/favourite_quotes_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search_author_quote/bindings/search_author_quote_binding.dart';
import '../modules/search_author_quote/views/search_author_quote_view.dart';
import '../modules/search_quotes/bindings/search_quotes_binding.dart';
import '../modules/search_quotes/views/search_quotes_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE_QUOTES,
      page: () => const FavouriteQuotesView(),
      binding: FavouriteQuotesBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_QUOTES,
      page: () => const SearchQuotesView(),
      binding: SearchQuotesBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_AUTHOR_QUOTE,
      page: () => const SearchAuthorQuoteView(),
      binding: SearchAuthorQuoteBinding(),
    ),
  ];
}
