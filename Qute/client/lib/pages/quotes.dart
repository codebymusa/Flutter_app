class Quotes {
  final String quote;
  final String author;

  Quotes(this.quote, this.author);

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(json['quote'], json['author']);
  }
}
