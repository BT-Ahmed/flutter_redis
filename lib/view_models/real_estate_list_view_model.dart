import 'package:flutter/foundation.dart';
import '../models/real_estate.dart';
import '../services/real_estate_service.dart';

class RealEstateListViewModel with ChangeNotifier {
  final RealEstateService realEstateService;
  List<RealEstate> realEstates = [];
  bool isLoading = false;
  String? errorMessage;

  RealEstateListViewModel({required this.realEstateService});

  Future<void> fetchRealEstates() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      realEstates = await realEstateService.getAllRealEstates();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Add a new real estate listing
  Future<void> addRealEstate(RealEstate newRealEstate) async {
    isLoading = true;
    notifyListeners();

    try {
      final addedRealEstate =
          await realEstateService.addRealEstate(newRealEstate);
      realEstates.add(addedRealEstate);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Update an existing real estate listing
  Future<void> updateRealEstate(RealEstate updatedRealEstate) async {
    isLoading = true;
    notifyListeners();

    try {
      await realEstateService.updateRealEstate(updatedRealEstate);
      int index = realEstates.indexWhere((re) => re.id == updatedRealEstate.id);
      if (index != -1) {
        realEstates[index] = updatedRealEstate;
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Delete a real estate listing
  Future<void> deleteRealEstate(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      await realEstateService.deleteRealEstate(id);
      realEstates.removeWhere((re) => re.id == id);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
