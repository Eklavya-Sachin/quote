import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quotes/app/services/db_service.dart';
import '../../../models/quote_response.dart';

class FavouriteQuotesController extends GetxController {
  final _dbService = Get.find<DataBaseService>();
  late TextEditingController searchTextController;

  RxList<Quote> favouriteQuotes = <Quote>[].obs;
  RxBool isLoadingFromDB = false.obs;

  @override
  Future<void> onInit() async {
    searchTextController = TextEditingController();
    await getQuotesFromDB();
    super.onInit();
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }

  Future<void> getQuotesFromDB() async {
    isLoadingFromDB.value = true;
    favouriteQuotes.value = await _dbService.getAllFavouriteQuotes();
    isLoadingFromDB.value = false;
  }

  void onSearch(String query) {
    if (GetUtils.isBlank(query)!) {
      cancelSearch();
    }

    query = query.toLowerCase();

    favouriteQuotes.value = favouriteQuotes
        .where(
          (searchedQuote) =>
              (searchedQuote.content?.toLowerCase().contains(query) ?? false) ||
              (searchedQuote.content?.toLowerCase().startsWith(query) ??
                  false) ||
              (searchedQuote.content?.toLowerCase().endsWith(query) ?? false),
        )
        .toList();
  }

  Future<void> cancelSearch() async {
    await getQuotesFromDB();
  }

  Future<void> deleteAllFavouriteQuotes() async {
    isLoadingFromDB.value = true;
    _dbService.deleteAllFavoriteQuotes();
    favouriteQuotes.clear();
    isLoadingFromDB.value = false;
  }
}
