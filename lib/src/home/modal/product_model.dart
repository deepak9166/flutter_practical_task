class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? image;
  String? category;

  ProductModel.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    image = json['image'];
    category = json['category'];
  }
}
