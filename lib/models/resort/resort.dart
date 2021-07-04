import 'package:sense_flutter/enums/resort_type.dart';
import 'package:sense_flutter/functions/enum_parser.dart';
import 'package:sense_flutter/models/review/review.dart';

class Resort {
  final String name;
  final double price;
  final List<String> specialties;
  final List<String> amenities;
  final String description;
  final ResortType type;
  final String location;
  final String address;
  final List<Review> reviews;
  final List<String> images;
  final double rating;
  final List<String> tags;

  Resort({
    this.name,
    this.price,
    this.specialties,
    this.amenities,
    this.description,
    this.type,
    this.location,
    this.address,
    this.reviews,
    this.images,
    this.rating,
    this.tags,
  });

  static Resort fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Resort(
            name: data["name"] ?? "",
            price: data["price"] ?? 0.0,
            specialties: toListString(data["specialties"]) ?? [],
            amenities: toListString(data["amenities"]) ?? [],
            description: data["description"] ?? "",
            type: EnumParser.getEnum(ResortType.values, data["type"]),
            location: data["location"] ?? "",
            address: data["address"] ?? "",
            reviews: Review.fromMapList(data["reviews"]) ?? [],
            images: toListString(data["images"]) ?? [],
            rating: data["rating"] ?? 0.0,
            tags: toListString(data["images"]) ?? [],
          );
  }

  static List<String> toListString(List<dynamic> data) {
    return data == null ? [] : data.map((e) => e as String).toList();
  }

  static List<Review> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }
}
