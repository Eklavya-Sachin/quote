import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../services/api_service.dart';
import '../../../models/quote_response.dart';

class SearchQuotesController extends GetxController {
  late TextEditingController searchTextController;
  RxList<Quote> quotes = <Quote>[].obs;
  RxBool isSearching = false.obs;
  RxString bodySearchText = 'Search Any Quote.'.obs;
  RxInt searchLimit = 10.obs;

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
    isSearching.value = true;
    quotes.value = await Get.find<ApiService>().getQuotes(
      query,
      searchLimit.value,
    );

    if (quotes.isEmpty) {
      bodySearchText.value = 'Nothing found related to $query!';
    }

    isSearching.value = false;
  }

  void cancelSearch() {
    bodySearchText.value = 'Search Any Quote.';
    quotes.value = [];
  }

  void updateSearchLimit(limit) {
    searchLimit.value = limit;
  }
}
