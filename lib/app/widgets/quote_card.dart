import 'package:get/get.dart';
import '../services/db_service.dart';
import '../models/quote_response.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final _dbService = Get.find<DataBaseService>();

  QuoteCard({
    super.key,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: Get.width,
      height: Get.height * .3,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(
            'images/quote_background.jpeg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                quote.content ?? 'NA',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    quote.author ?? 'NA',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FutureBuilder<bool>(
                    future: _dbService.isFavouriteQuote(quote),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox();
                      }

                      RxBool isFavourite = (snapshot.data ?? false).obs;
                      return Obx(
                        () => IconButton(
                          icon: Icon(
                            isFavourite.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                isFavourite.value ? Colors.red : Colors.white,
                            size: 25,
                          ),
                          onPressed: () async {
                            await _dbService.addOrRemoveFromFavorite(
                              quote,
                            );
                            isFavourite.toggle();
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
