import 'package:flutter/material.dart';
import '../../models/real_estate.dart';

class RealEstateDetailScreen extends StatelessWidget {
  final RealEstate realEstate;

  RealEstateDetailScreen({Key? key, required this.realEstate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(realEstate.title), // Display the title of the real estate
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Details',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text('Price: \$${realEstate.price}'),
              Text(
                  'Category: ${realEstate.category.name}'), // Assuming enum has a name property
              Text(
                  'Type: ${realEstate.listingType.name}'), // Assuming enum has a name property
              Text('Rooms: ${realEstate.roomsCount}'),
              Text('Bathrooms: ${realEstate.bathroomsCount}'),
              Text('Surface: ${realEstate.surface} sqm'),
              Text('City: ${realEstate.city}'),
              Text('Region: ${realEstate.region}'),
              // Add more details as needed
            ],
          ),
        ),
      ),
    );
  }
}
