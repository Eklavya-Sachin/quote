import 'package:get/get_connect.dart';
import 'package:flutter/material.dart';
import '../models/quote_response.dart';

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
        'limit': limit.toString(),
      },
    );

    debugPrint(
      '\n╔══════════════════════════ Response ══════════════════════════\n'
      '╟ REQUEST ║ ${response.request?.method.toUpperCase()}\n'
      '╟ url: ${response.request?.url}\n'
      '╟ Headers: ${response.request?.headers}\n'
      '╟ Body: ${response.request?.bodyBytes.map((event) => event.asMap().toString())}\n'
      '╟ Status Code: ${response.statusCode}\n'
      '╟ Data: ${response.bodyString?.toString() ?? ''}'
      '\n╚══════════════════════════ Response ══════════════════════════\n',
      wrapWidth: 1024,
    );

    if (response.isOk) {
      quotes = QuoteResponse.fromJson(response.body).quotes ?? [];
    }
    return quotes;
  }
}
