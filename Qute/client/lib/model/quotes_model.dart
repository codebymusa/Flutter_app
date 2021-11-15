import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:qutequotes/pages/quotes.dart';
import 'package:http/http.dart' as http;

Future<List<Quotes>> fetchQuotes() async {
  final response =
      await http.get(Uri.parse('http://5f0a-102-39-20-46.ngrok.io/quotes'));
  if (response.statusCode == 200) {
    Iterable quotes = jsonDecode(response.body);
    return List<Quotes>.from(quotes.map((e) => Quotes.fromJson(e)));
  } else if (response.statusCode == 404) {
    return [];
  } else if (response.statusCode == 500) {}

  return [];
}

Future<Quotes> _addQuote(Quotes quote) async {
  final response = await http.post(
      Uri.parse(" http://5f0a-102-39-20-46.ngrok.io/quote"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(
          <String, String>{"author": quote.author, "quote": quote.quote}));
  if (response.statusCode == 201) {
    return Quotes.fromJson(jsonDecode(response.body));
  }
  return Quotes("", "");
}

class QuotesModel with ChangeNotifier {
  final Future<List<Quotes>> _quotes = fetchQuotes();
  // [
  //   Quotes("Doubt kills more dreams than failure ever will.", "Suzy Kassem"),
  //   Quotes(
  //       "Hardships often prepare ordinary people for an extraordinary destiny.",
  //       "Unknown"),
  //   Quotes(
  //       "We delight in the beauty of the butterfly, but rarely admit the changes it has gone through to achieve that beauty.",
  //       "Maya Angelou"),
  //   Quotes(
  //       "Don't let the nocise of others' opinions drown you out of your inner voice",
  //       "Steve Jobs"),
  //   Quotes(
  //       "Go confidently in the direction of your dreams. Live the life you have imagined.",
  //       "Henry David Thoreau"),
  //   Quotes(
  //       "Give yourself permission to slow down. You can speed up by slowing down.",
  //       "Gabby Bernstein")
  // ];

  Future<List<Quotes>> get quotes => fetchQuotes();

  Future<Quotes> quote(int index) => _quotes.then((value) => value[index]);

  void addQuote(Quotes quotes) {
    _addQuote(quotes);
    notifyListeners();
  }
}

class QuoteModel with ChangeNotifier {
  late Quotes _quote;

  set setQuote(Quotes quote) => _quote = quote;

  Quotes get quote => _quote;
}
