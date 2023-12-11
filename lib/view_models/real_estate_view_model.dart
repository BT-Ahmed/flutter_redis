import 'package:flutter/foundation.dart';
import '../models/real_estate.dart';
import '../services/real_estate_service.dart';

class RealEstateViewModel with ChangeNotifier {
  final RealEstateService realEstateService;
  List<RealEstate> realEstates = []; // Define the list to hold real estate entries
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

  Future<void> addRealEstate(RealEstate realEstate) async {
    try {
      var addedRealEstate = await realEstateService.addRealEstate(realEstate);
      realEstates.add(addedRealEstate); // Add the new real estate to the local list
      notifyListeners(); // Notify listeners to update UI
    } catch (e) {
      errorMessage = e.toString(); // Assign the error message
      notifyListeners(); // Notify listeners there was an error
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
