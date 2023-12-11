enum RealEstateCategory {
  landAndFarms,
  apartments,
  vacationRentals,
  shops,
  housesAndVillas,
  sharedRooms,
  officesAndPlates,
}

extension RealEstateCategoryExtension on RealEstateCategory {
  String get name {
    switch (this) {
      case RealEstateCategory.landAndFarms:
        return 'Land and Farms';
      case RealEstateCategory.apartments:
        return 'Apartments';
      case RealEstateCategory.vacationRentals:
        return 'Vacation Rentals';
      case RealEstateCategory.shops:
        return 'Shops';
      case RealEstateCategory.housesAndVillas:
        return 'Houses and Villas';
      case RealEstateCategory.sharedRooms:
        return 'Shared Rooms';
      case RealEstateCategory.officesAndPlates:
        return 'Offices and Plates';
      default:
        return "Unknown Category";
    }
  }
}
