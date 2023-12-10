import 'package:flutter_redis/models/real_estate_category.dart';
import 'package:flutter_redis/models/real_estate_listing_type.dart';

class RealEstate {
  final int id;
  final String title;
  final double price;
  final RealEstateCategory category; // Assuming you have an enum for categories
  final RealEstateListingType
      listingType; // Assuming you have an enum for listing types
  final int roomsCount;
  final int bathroomsCount;
  final double surface;
  final String city;
  final String region;

  RealEstate({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.listingType,
    required this.roomsCount,
    required this.bathroomsCount,
    required this.surface,
    required this.city,
    required this.region,
  });

  // Convert a RealEstate instance into a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category.toString().split('.').last,
      'listingType': listingType.toString().split('.').last,
      'roomsCount': roomsCount,
      'bathroomsCount': bathroomsCount,
      'surface': surface,
      'city': city,
      'region': region,
    };
  }

  // Create a RealEstate instance from a map
  factory RealEstate.fromJson(Map<String, dynamic> map) {
    return RealEstate(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      category: RealEstateCategory.values
          .firstWhere((e) => e.toString().split('.').last == map['category']),
      listingType: RealEstateListingType.values.firstWhere(
          (e) => e.toString().split('.').last == map['listingType']),
      roomsCount: map['roomsCount'],
      bathroomsCount: map['bathroomsCount'],
      surface: map['surface'],
      city: map['city'],
      region: map['region'],
    );
  }
}
