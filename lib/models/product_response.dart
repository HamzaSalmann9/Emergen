class ProductResponse {
  bool success;
  Result result;

  ProductResponse({
    required this.success,
    required this.result,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'],
      result: Result.fromJson(json['result']),
    );
  }
}

class Result {
  int totalPages;
  List<Product> data;
  int limit;
  int currentPage;

  Result({
    required this.totalPages,
    required this.data,
    required this.limit,
    required this.currentPage,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      totalPages: json['totalPages'],
      data: List<Product>.from(json['data'].map((x) => Product.fromJson(x))),
      limit: json['limit'],
      currentPage: json['currentPage'],
    );
  }
}

class Product {
  String id;
  String title;
  String image;
  List<Genre> genre;
  Region region;
  List<Tag> tags;
  Platform platform;
  int sellingPrice;
  bool isKid;
  String description;
  String type;
  bool show;
  int rents;
  int averageRentTime;
  String code;
  int level;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  int inStock;
  int allStocks;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.genre,
    required this.region,
    required this.tags,
    required this.platform,
    required this.sellingPrice,
    required this.isKid,
    required this.description,
    required this.type,
    required this.show,
    required this.rents,
    required this.averageRentTime,
    required this.code,
    required this.level,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.inStock,
    required this.allStocks,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
      genre: List<Genre>.from(json['genre'].map((x) => Genre.fromJson(x))),
      region: Region.fromJson(json['region']),
      tags: List<Tag>.from(json['tags'].map((x) => Tag.fromJson(x))),
      platform: Platform.fromJson(json['platform']),
      sellingPrice: json['sellingPrice'],
      isKid: json['isKid'],
      description: json['description'],
      type: json['type'],
      show: json['show'],
      rents: json['rents'],
      averageRentTime: json['averageRentTime'],
      code: json['code'],
      level: json['level'],
      quantity: json['quantity'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      inStock: json['inStock'],
      allStocks: json['allStocks'],
    );
  }
}

class Genre {
  String id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Genre({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['_id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class Region {
  String id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Region({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['_id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class Tag {
  String id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Tag({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['_id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class Platform {
  String id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Platform({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Platform.fromJson(Map<String, dynamic> json) {
    return Platform(
      id: json['_id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}
