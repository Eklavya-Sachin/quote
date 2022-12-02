import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favourite_quotes_controller.dart';

class FavouriteQuotesView extends GetView<FavouriteQuotesController> {
  const FavouriteQuotesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavouriteQuotesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FavouriteQuotesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
