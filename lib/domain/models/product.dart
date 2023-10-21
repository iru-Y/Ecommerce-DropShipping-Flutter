// ignore_for_file: unnecessary_this

class Product {
  String? id;
  String? description;
  int? quantity;
  double? price;
  String? productImage;

  Product({this.description, this.quantity, this.price, this.productImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['productImage'] = this.productImage;
    return data;
  }
}
