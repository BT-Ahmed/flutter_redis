import 'package:flutter/material.dart';
import '../../view_models/real_estate_list_view_model.dart';
import '../../widgets/real_estate_listing/real_estate_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Estate Listings'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => RealEstateListViewModel(),
        child: Consumer<RealEstateListViewModel>(
          builder: (context, viewModel, child) {
            return FutureBuilder(
              future: viewModel.fetchRealEstates(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return RealEstateList(realEstates: viewModel.realEstates);
                }
              },
            );
          },
        ),
      ),
    );
  }
}