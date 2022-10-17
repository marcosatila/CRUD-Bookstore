class Book {
  String authorId;
  String nameAuthor;


  Book({

    required this.authorId,
    required this.nameAuthor,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      authorId:json["author_id"],
      nameAuthor: json["name_author"],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author_id'] = authorId;
    data['name_author'] = nameAuthor;

    return data;
  }
}
