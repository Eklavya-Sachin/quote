import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/quote_response.dart';

class FavouriteQuotesController extends GetxController {
  late TextEditingController searchTextController;
  RxList<Quote> quotes = <Quote>[].obs;
  RxBool isLoadingFromDB = false.obs;

  @override
  void onInit() {
    searchTextController = TextEditingController();
    getQuotesFromDB();
    super.onInit();
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }

  void getQuotesFromDB() {}

  void onSearch(String query) {
    if (GetUtils.isBlank(query)!) {
      Get.snackbar('Invalid Search!', 'Can\'t search blank keyword.');
      return;
    }

    query = query.toLowerCase();

    quotes.value = quotes
        .where(
          (searchedQuote) =>
              (searchedQuote.author?.toLowerCase().contains(query) ?? false) ||
              (searchedQuote.author?.toLowerCase().startsWith(query) ??
                  false) ||
              (searchedQuote.author?.toLowerCase().endsWith(query) ?? false),
        )
        .toList();
  }

  void cancelSearch() {
    getQuotesFromDB();
  }

  void deleteAllFavouriteQuotes() {}
}
