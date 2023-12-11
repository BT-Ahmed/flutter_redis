import 'package:flutter/material.dart';
import 'package:flutter_redis/screens/real_estate_detail_screen.dart';
import '../../models/real_estate.dart';

class RealEstateListItem extends StatelessWidget {
  final RealEstate realEstate;

  const RealEstateListItem({super.key, required this.realEstate});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ListTile(
        leading: const Icon(Icons.home), // Placeholder for an image or an icon
        title: Text(realEstate.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(realEstate.category.name),
            Text(realEstate.listingType.name),
            Text('Price: \$${realEstate.price}'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to the detail screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => RealEstateDetailScreen(realEstate: realEstate),
            ),
          );
        },
      ),
    );
  }
}
