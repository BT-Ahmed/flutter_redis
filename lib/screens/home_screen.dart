import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/real_estate_service.dart';
import '../view_models/real_estate_list_view_model.dart';
import '../view_models/real_estate_view_model.dart';
import '../widgets/real_estate_listing/real_estate_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/real_estate_list_view_model.dart';
import '../widgets/real_estate_listing/real_estate_list.dart';
import 'real_estate_form_screen.dart'; // Import the form screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _fetchRealEstatesFuture;

  @override
  void initState() {
    super.initState();
    _fetchRealEstatesFuture = _fetchRealEstates();
  }

  Future<void> _fetchRealEstates() async {
    final viewModel = Provider.of<RealEstateListViewModel>(context, listen: false);
    return viewModel.fetchRealEstates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Estate Listings'),
      ),
      body: RefreshIndicator(
        onRefresh: _fetchRealEstates,
        child: FutureBuilder(
          future: _fetchRealEstatesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            return Consumer<RealEstateListViewModel>(
              builder: (context, viewModel, child) {
                return RealEstateList(realEstates: viewModel.realEstates);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<RealEstateViewModel>(
              create: (newContext) => RealEstateViewModel(realEstateService: RealEstateService()),
              child: RealEstateFormScreen(),
            ),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
