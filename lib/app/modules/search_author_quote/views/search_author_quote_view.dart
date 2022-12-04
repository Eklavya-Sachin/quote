import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/quote_card.dart';
import '../../../widgets/search_text_field.dart';
import '../controllers/search_author_quote_controller.dart';

class SearchAuthorQuoteView extends GetView<SearchAuthorQuoteController> {
  const SearchAuthorQuoteView({Key? key}) : super(key: key);

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
              'Search Author Quote',
              style: TextStyle(fontSize: 22, color: Colors.black54),
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
                  itemCount: 1,
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
