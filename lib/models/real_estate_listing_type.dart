enum RealEstateListingType { forSale, forRent }

extension RealEstateListingTypeExtension on RealEstateListingType {
  String get name {
    switch (this) {
      case RealEstateListingType.forSale:
        return 'For Sale';
      case RealEstateListingType.forRent:
        return 'For Rent';
      default:
        return "";
    }
  }
}
