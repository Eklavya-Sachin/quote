import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/quote_card.dart';
import '../../../widgets/search_text_field.dart';
import '../controllers/search_quotes_controller.dart';

class SearchQuotesView extends GetView<SearchQuotesController> {
  const SearchQuotesView({Key? key}) : super(key: key);

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
              'Search Quotes',
              style: TextStyle(fontSize: 22, color: Colors.black54),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: SearchTextField(
                  controller: controller.searchTextController,
                  search: controller.onSearch,
                  hintText: 'Search any quote...',
                  onCancellingSearch: controller.cancelSearch,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Obx(
                  () => Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        // Initial Value
                        value: controller.searchLimit.value,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: List.generate(
                          100,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        onChanged: controller.updateSearchLimit,
                        iconSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
