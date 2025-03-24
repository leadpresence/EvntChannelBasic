
// lib/features/products/models/product.dart
import 'package:evnt/src/features/products/models/product_dto.dart';
import 'package:isar/isar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';

 
@Collection()
class Product {
    Id id = Isar.autoIncrement;
 
    @Default(false) bool isFavorite=false;


   String? title;

   String? description;

   String? category;

   double? price;

   double? discountPercentage;

   double? rating;

   int? stock;

   @Default([])  List<String>? tags;

   String? brand;

   String? sku;

   int? weight;

   Dimensions? dimensions;

   String? warrantyInformation;

   String? shippingInformation;

   String? availabilityStatus;

   @Default([])  List<Review>? reviews;

   String? returnPolicy;

   int? minimumOrderQuantity;

   Meta? meta;

   @Default([])  List<String>? images;

   String? thumbnail;

  

}

// Product productFromDto(ProductDto dto) {
//   return Product()..
//     title  dto.title,
//     ..description: dto.description,
//     category: dto.category,
//     price: dto.price,
//     discountPercentage: dto.discountPercentage,
//     rating: dto.rating,
//     stock: dto.stock,
//     tags: dto.tags,
//     brand: dto.brand,
//     sku: dto.sku,
//     weight: dto.weight,
//     dimensions: dto.dimensions,
//     warrantyInformation: dto.warrantyInformation,
//     shippingInformation: dto.shippingInformation,
//     availabilityStatus: dto.availabilityStatus,
//     reviews: dto.reviews,
//     returnPolicy: dto.returnPolicy,
//     minimumOrderQuantity: dto.minimumOrderQuantity,
//     meta: dto.meta,
//     images: dto.images,
//     thumbnail: dto.thumbnail,
//   );
// } 