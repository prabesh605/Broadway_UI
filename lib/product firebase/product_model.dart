class ProductModel {
  String? id;
  String name;
  double price;
  String image;
  String description;
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
  factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
    return ProductModel(
      id: id,
      name: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'image': image,
    'description': description,
  };
}
