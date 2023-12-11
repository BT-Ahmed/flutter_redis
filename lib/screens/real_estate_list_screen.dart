import 'package:flutter/material.dart';
import '../view_models/real_estate_list_view_model.dart';
import '../services/real_estate_service.dart';
import '../widgets/real_estate_listing/real_estate_list.dart';
import 'package:provider/provider.dart';

class RealEstateListScreen extends StatefulWidget {
  @override
  _RealEstateListScreenState createState() => _RealEstateListScreenState();
}

class _RealEstateListScreenState extends State<RealEstateListScreen> {
  late Future<void> _fetchRealEstatesFuture;

  @override
  void initState() {
    super.initState();
    _fetchRealEstatesFuture = _fetchRealEstates();
  }

  Future<void> _fetchRealEstates() {
    final viewModel = Provider.of<RealEstateListViewModel>(context, listen: false);
    return viewModel.fetchRealEstates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Estate Listings'),
      ),
      body: FutureBuilder(
        future: _fetchRealEstatesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<RealEstateListViewModel>(
              builder: (context, viewModel, child) {
                return RealEstateList(realEstates: viewModel.realEstates);
              },
            );
          }
        },
      ),
    );
  }
}
