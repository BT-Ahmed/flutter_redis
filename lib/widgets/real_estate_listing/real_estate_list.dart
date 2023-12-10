import 'package:flutter/material.dart';
import 'real_estate_list_item.dart';
import '../../models/real_estate.dart';

class RealEstateList extends StatelessWidget {
  final List<RealEstate> realEstates;

  const RealEstateList({Key? key, required this.realEstates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: realEstates.length,
      itemBuilder: (context, index) {
        return RealEstateListItem(realEstate: realEstates[index]);
      },
    );
  }
}
