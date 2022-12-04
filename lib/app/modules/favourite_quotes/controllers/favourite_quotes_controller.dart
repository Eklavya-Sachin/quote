import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavouriteQuotesController extends GetxController {
  late TextEditingController searchTextController;

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

  Future<void> onSearch(String query) async {}
}
