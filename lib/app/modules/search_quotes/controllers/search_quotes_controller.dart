import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchQuotesController extends GetxController {
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
