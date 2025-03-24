// import 'package:evnt/src/features/ProductDtos/models/ProductDto.dart';
import 'package:evnt/src/features/products/models/product.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDtoResponse {
  @JsonKey(name: 'ProductDtos', defaultValue: [])
  final List<ProductDto>? ProductDtos;

  @JsonKey(name: 'total', defaultValue: 0)
  final int? total;

  @JsonKey(name: 'skip', defaultValue: 0)
  final int? skip;

  @JsonKey(name: 'limit', defaultValue: 0)
  final int? limit;

  ProductDtoResponse({this.ProductDtos, this.total, this.skip, this.limit});

  factory ProductDtoResponse.fromJson(Map<String, dynamic> json) => _$ProductDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoResponseToJson(this);
}

@JsonSerializable()
class ProductDto {
  @JsonKey(name: 'id', defaultValue: 0)
  final int? id;

  @JsonKey(name: 'title', defaultValue: "")
  final String? title;

  @JsonKey(name: 'description', defaultValue: "")
  final String? description;

  @JsonKey(name: 'category', defaultValue: "")
  final String? category;

  @JsonKey(name: 'price', defaultValue: 0.0)
  final double? price;

  @JsonKey(name: 'discountPercentage', defaultValue: 0.0)
  final double? discountPercentage;

  @JsonKey(name: 'rating', defaultValue: 0.0)
  final double? rating;

  @JsonKey(name: 'stock', defaultValue: 0)
  final int? stock;

  @JsonKey(name: 'tags', defaultValue: [])
  final List<String>? tags;

  @JsonKey(name: 'brand', defaultValue: "")
  final String? brand;

  @JsonKey(name: 'sku', defaultValue: "")
  final String? sku;

  @JsonKey(name: 'weight', defaultValue: 0)
  final int? weight;

  @JsonKey(name: 'dimensions')
  final Dimensions? dimensions;

  @JsonKey(name: 'warrantyInformation', defaultValue: "")
  final String? warrantyInformation;

  @JsonKey(name: 'shippingInformation', defaultValue: "")
  final String? shippingInformation;

  @JsonKey(name: 'availabilityStatus', defaultValue: "")
  final String? availabilityStatus;

  @JsonKey(name: 'reviews', defaultValue: [])
  final List<Review>? reviews;

  @JsonKey(name: 'returnPolicy', defaultValue: "")
  final String? returnPolicy;

  @JsonKey(name: 'minimumOrderQuantity', defaultValue: 0)
  final int? minimumOrderQuantity;

  @JsonKey(name: 'meta')
  final Meta? meta;

  @JsonKey(name: 'images', defaultValue: [])
  final List<String>? images;

  @JsonKey(name: 'thumbnail', defaultValue: "")
  final String? thumbnail;

  ProductDto({
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

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

@JsonSerializable()
@embedded
class Dimensions {
    

  @JsonKey(name: 'width', defaultValue: 0.0)
  final double? width;

  @JsonKey(name: 'height', defaultValue: 0.0)
  final double? height;

  @JsonKey(name: 'depth', defaultValue: 0.0)
  final double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}

@JsonSerializable()
@embedded
class Review {
 

  @JsonKey(name: 'rating', defaultValue: 0)
  final int? rating;

  @JsonKey(name: 'comment', defaultValue: "")
  final String? comment;

  @JsonKey(name: 'date', defaultValue: "")
  final String? date;

  @JsonKey(name: 'reviewerName', defaultValue: "")
  final String? reviewerName;

  @JsonKey(name: 'reviewerEmail', defaultValue: "")
  final String? reviewerEmail;

  Review({this.rating, this.comment, this.date, this.reviewerName, this.reviewerEmail});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
@embedded
class Meta {
  

  @JsonKey(name: 'createdAt', defaultValue: "")
  final String? createdAt;

  @JsonKey(name: 'updatedAt', defaultValue: "")
  final String? updatedAt;

  @JsonKey(name: 'barcode', defaultValue: "")
  final String? barcode;

  @JsonKey(name: 'qrCode', defaultValue: "")
  final String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

extension ProductMapper on ProductDto {
  Product toProduct() {
    final product = Product();

    product.title = title;
    product.description = description;
    product.category = category;
    product.price = price;
    product.discountPercentage = discountPercentage;
    product.rating = rating;
    product.stock = stock;
    product.tags = tags ?? [];
    product.brand = brand;
    product.sku = sku;
    product.weight = weight;
    product.dimensions = dimensions;
    product.warrantyInformation = warrantyInformation;
    product.shippingInformation = shippingInformation;
    product.availabilityStatus = availabilityStatus;
    product.reviews = reviews ?? [];
    product.returnPolicy = returnPolicy;
    product.minimumOrderQuantity = minimumOrderQuantity;
    product.meta = meta;
    product.images = images ?? [];
    product.thumbnail = thumbnail;

    return product;
  }
}
