class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  double? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price']?.toDouble(),
      discountPercentage: json['discountPercentage']?.toDouble(),
      rating: json['rating']?.toDouble(),
      stock: json['stock'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight']?.toDouble(),
      dimensions: json['dimensions'] != null
          ? Dimensions.fromJson(json['dimensions'])
          : null,
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
              .map((review) => Review.fromJson(review))
              .toList()
          : null,
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      thumbnail: json['thumbnail'],
    );
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width']?.toDouble(),
      height: json['height']?.toDouble(),
      depth: json['depth']?.toDouble(),
    );
  }
}

class Review {
  double? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Review(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating']?.toDouble(),
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }
}

class ProductResponse {
  List<Product>? products;

  ProductResponse({this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      products: json['products'] != null
          ? (json['products'] as List)
              .map((product) => Product.fromJson(product))
              .toList()
          : null,
    );
  }
}
