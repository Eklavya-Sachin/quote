import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../services/api_service.dart';
import '../../../models/quote_response.dart';

class SearchAuthorQuoteController extends GetxController {
  late TextEditingController searchTextController;
  RxList<Quote> quotes = <Quote>[].obs;
  RxBool isSearching = false.obs;
  RxString bodySearchText = 'Search Quote by Author Name.'.obs;

  @override
  void onInit() {
    searchTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }

  Future<void> onSearch(String query) async {
    if (GetUtils.isBlank(query)!) {
      Get.snackbar('Invalid Search!', 'Can\'t search blank keyword.');
      return;
    }

    query = query.toLowerCase();
    isSearching.value = true;
    final searchedQuotes = await Get.find<ApiService>().getQuotes(
      query,
      1,
    );

    quotes.value = searchedQuotes
        .where(
          (searchedQuote) =>
              (searchedQuote.author?.toLowerCase().contains(query) ?? false) ||
              (searchedQuote.author?.toLowerCase().startsWith(query) ??
                  false) ||
              (searchedQuote.author?.toLowerCase().endsWith(query) ?? false),
        )
        .toList();

    if (quotes.isEmpty) {
      bodySearchText.value = 'Nothing found related to $query!';
    }

    isSearching.value = false;
  }

  void cancelSearch() {
    bodySearchText.value = 'Search Quote by Author Name.';
    quotes.value = [];
  }
}
