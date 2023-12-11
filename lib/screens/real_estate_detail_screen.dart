import 'package:flutter/material.dart';
import '../models/real_estate.dart';

class RealEstateDetailScreen extends StatelessWidget {
  final RealEstate realEstate;

  const RealEstateDetailScreen({Key? key, required this.realEstate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(realEstate.title), // Display the title of the real estate
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(),
                  detailRow('Price', '\$${realEstate.price}'),
                  detailRow('Category', realEstate.category.name), // Assuming enum has a name property
                  detailRow('Type', realEstate.listingType.name), // Assuming enum has a name property
                  detailRow('Rooms', '${realEstate.roomsCount}'),
                  detailRow('Bathrooms', '${realEstate.bathroomsCount}'),
                  detailRow('Surface', '${realEstate.surface} m²'),
                  detailRow('City', realEstate.city),
                  detailRow('Region', realEstate.region),
                  // Add more details as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
