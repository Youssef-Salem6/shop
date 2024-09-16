class ProductsModel {
  int? id;
  String? title, description, category, image, price, rate, count;

  ProductsModel({
    required this.id,
    required this.title,
    required this.category,
    required this.count,
    required this.description,
    required this.image,
    required this.price,
    required this.rate,
  });

  ProductsModel.fromjson(Map jsonData) {
    id = jsonData["id"];
    title = jsonData["title"];
    price = jsonData["price"].toString();
    description = jsonData["description"];
    category = jsonData["category"];
    image = jsonData["image"];
    rate = jsonData["rating"]["rate"].toString();
    count = jsonData["rating"]["count"].toString();
  }
}
