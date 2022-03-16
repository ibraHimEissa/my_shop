import 'dart:convert';

ChangeFavoritesModel changeFavoritesModelFromJson(String str) => ChangeFavoritesModel.fromJson(json.decode(str));

String changeFavoritesModelToJson(ChangeFavoritesModel data) => json.encode(data.toJson());

class ChangeFavoritesModel {
  ChangeFavoritesModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory ChangeFavoritesModel.fromJson(Map<String, dynamic> json) => ChangeFavoritesModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.product,
  });

  int? id;
  Product? product;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product!.toJson(),
  };
}

class Product {
  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
  });

  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"],
    oldPrice: json["old_price"],
    discount: json["discount"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
  };
}
