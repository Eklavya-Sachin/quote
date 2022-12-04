import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/quote_card.dart';
import '../../../widgets/search_text_field.dart';
import '../controllers/favourite_quotes_controller.dart';

class FavouriteQuotesView extends GetView<FavouriteQuotesController> {
  const FavouriteQuotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: const BackButton(color: Colors.black54),
            title: const Text(
              'Favourite Quote',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SearchTextField(
                  controller: controller.searchTextController,
                  search: controller.onSearch,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return QuoteCard(
                      title:
                          'The greatest glory in living lies not in never falling, but in rising every time we fall.',
                      text: 'Nelson Mandela',
                      onFavoriteTap: () {},
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
