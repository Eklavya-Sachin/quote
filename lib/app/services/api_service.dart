import 'package:get/get_connect.dart';
import 'package:quotes/app/models/quote_response.dart';

class ApiService {
  final _baseUrl = 'https://api.quotable.io/search/quotes';

  Future<List<Quote>> getQuotes(String searchQuery, int limit) async {
    List<Quote> quotes = [];

    final response = await GetConnect(
      timeout: const Duration(seconds: 10),
    ).get(
      _baseUrl,
      query: {
        'query': searchQuery,
        'limit': limit,
      },
    );

    if (response.isOk) {
      quotes = QuoteResponse.fromJson(response.body).quotes ?? [];
    }
    return quotes;
  }
}
