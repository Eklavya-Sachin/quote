import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../models/quote_response.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseService {
  final String quotesTable = 'QuotesTable';

  Future<Database> _init() async {
    /// Returns a directory which stores permanent files
    Directory directory = await getApplicationDocumentsDirectory();

    /// Create path to database
    final quotesDataBasePath = join(
      directory.path,
      "favourite_quotes.db",
    );

    /// Open the database or create a database if there isn't any.
    return await openDatabase(
      quotesDataBasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''CREATE TABLE $quotesTable(
          _id TEXT,
          content TEXT,
          author TEXT)''',
        );
      },
    );
  }

  Future<bool> isFavouriteQuote(Quote quote) async {
    // Open database.
    final db = await _init();

    var similiarQuote = await db.query(
      quotesTable,
      where: '_id = ?',
      whereArgs: [quote.id],
    );

    return similiarQuote.isNotEmpty;
  }

  Future<void> addOrRemoveFromFavorite(Quote quote) async {
    final db = await _init();
    final isFavourite = await isFavouriteQuote(quote);
    if (isFavourite) {
      db.delete(
        quotesTable,
        where: '_id = ?',
        whereArgs: [quote.id],
      );
    } else {
      db.insert(
        quotesTable,
        quote.toJson(),
      );
    }
  }

  Future<void> deleteAllFavoriteQuotes() async {
    final db = await _init();

    db.delete(
      quotesTable,
    );
  }

  Future<List<Quote>> getAllFavouriteQuotes() async {
    final db = await _init();
    final quotes = await db.query(quotesTable);
    debugPrint('These are favourite quotes ==> $quotes');

    return quotes.map((quote) => Quote.fromJson(quote)).toList();
  }
}
