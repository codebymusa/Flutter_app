import 'package:flutter/foundation.dart';
import 'package:qutequotes/pages/quotes.dart';

class QuotesModel with ChangeNotifier {
  final List<Quotes> _quotes = [
    Quotes("Doubt kills more dreams than failure ever will.", "Suzy Kassem"),
    Quotes(
        "Hardships often prepare ordinary people for an extraordinary destiny.",
        "Unknown"),
    Quotes(
        "We delight in the beauty of the butterfly, but rarely admit the changes it has gone through to achieve that beauty.",
        "Maya Angelou"),
    Quotes(
        "Don't let the nocise of others' opinions drown you out of your inner voice",
        "Steve Jobs"),
    Quotes(
        "Go confidently in the direction of your dreams. Live the life you have imagined.",
        "Henry David Thoreau"),
    Quotes(
        "Give yourself permission to slow down. You can speed up by slowing down.",
        "Gabby Bernstein")
  ];

  List<Quotes> get quotes => _quotes;

  Quotes quote(int index) => _quotes[index];

  void addQuote(Quotes quotes) {
    _quotes.add(quotes);
    notifyListeners();
  }
}

class QuoteModel with ChangeNotifier {
  late Quotes _quote;

  set setQuote(Quotes quote) => _quote = quote;

  Quotes get quote => _quote;
}
