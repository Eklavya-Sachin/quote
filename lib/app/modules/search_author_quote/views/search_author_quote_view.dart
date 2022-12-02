import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_author_quote_controller.dart';

class SearchAuthorQuoteView extends GetView<SearchAuthorQuoteController> {
  const SearchAuthorQuoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchAuthorQuoteView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchAuthorQuoteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
