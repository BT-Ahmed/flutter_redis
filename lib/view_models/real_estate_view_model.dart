import 'package:flutter/foundation.dart';
import '../models/real_estate.dart';
import '../services/real_estate_service.dart';

class RealEstateViewModel with ChangeNotifier {
  final RealEstateService realEstateService;
  RealEstate? realEstate;
  bool isLoading = false;
  String? errorMessage;

  RealEstateViewModel({required this.realEstateService});

  // Fetch a specific real estate item by its ID
  Future<void> fetchRealEstate(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      realEstate = await realEstateService.getRealEstateById(id);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Update a real estate item
  Future<void> updateRealEstate(RealEstate updatedRealEstate) async {
    isLoading = true;
    notifyListeners();

    try {
      await realEstateService.updateRealEstate(updatedRealEstate);
      realEstate = updatedRealEstate;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Delete a real estate item
  Future<void> deleteRealEstate(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      await realEstateService.deleteRealEstate(id);
      realEstate = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
