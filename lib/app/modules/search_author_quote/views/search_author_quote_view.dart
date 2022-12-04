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
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: SearchTextField(
                  controller: controller.searchTextController,
                  search: controller.onSearch,
                  hintText: 'Search Author Quote...',
                  onCancellingSearch: controller.cancelSearch,
                ),
              ),
            ),
          ),
          body: Obx(
            () => controller.isSearching.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.quotes.isEmpty
                    ? Center(
                        child: Text(
                          controller.bodySearchText.value,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        itemCount: controller.quotes.length,
                        itemBuilder: (context, index) {
                          return QuoteCard(
                            quote: controller.quotes[index],
                          );
                        },
                      ),
          ),
        ),
      ),
    );
  }
}
