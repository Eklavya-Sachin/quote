class QuoteResponse {
  QuoteResponse({
    this.quotes,
  });

  List<Quote>? quotes;

  factory QuoteResponse.fromJson(Map<String, dynamic> json) => QuoteResponse(
        quotes: List<Quote>.from(
          json["results"].map(
            (x) => Quote.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(
          quotes!.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Quote {
  Quote({
    this.id,
    this.content,
    this.author,
  });

  String? id;
  String? content;
  String? author;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
      };
}
