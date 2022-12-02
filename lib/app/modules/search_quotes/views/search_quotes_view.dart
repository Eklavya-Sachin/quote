import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_quotes_controller.dart';

class SearchQuotesView extends GetView<SearchQuotesController> {
  const SearchQuotesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchQuotesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchQuotesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
