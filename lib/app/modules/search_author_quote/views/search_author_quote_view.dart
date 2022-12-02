import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/quote_card.dart';
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
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20),
                height: 50,
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'search',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    fillColor: Colors.black12,
                    filled: true,
                    prefixIconColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
