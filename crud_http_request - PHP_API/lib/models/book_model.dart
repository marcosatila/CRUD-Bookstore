class Book {
  String id;
  String nameProduct;
  String pages;
  String price;
  String authorId;
  String nameAuthor;
  String publisherId;
  String namePublisher;

  Book({
    required this.id,
    required this.nameProduct,
    required this.pages,
    required this.price,
    required this.authorId,
    required this.nameAuthor,
    required this.publisherId,
    required this.namePublisher,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"],
      nameProduct: json["name_product"],
      pages: json["pages"],
      price: json["price"],
      authorId: json["author_id"],
      nameAuthor: json["name_author"],
      publisherId: json["publisher_id"],
      namePublisher: json["name_publisher"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_product'] = nameProduct;
    data['pages'] = pages;
    data['price'] = price;
    data['name_author'] = nameAuthor;
    data['name_publisher'] = namePublisher;
    return data;
  }
}
