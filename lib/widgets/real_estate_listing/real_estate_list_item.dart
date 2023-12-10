import 'package:flutter/material.dart';
import 'package:flutter_redis/screens/real_estate_detail/real_estate_detail_screen.dart';
import '../../models/real_estate.dart';

class RealEstateListItem extends StatelessWidget {
  final RealEstate realEstate;

  const RealEstateListItem({Key? key, required this.realEstate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ListTile(
        leading: Icon(Icons.home), // Placeholder for an image or an icon
        title: Text(realEstate.title),
        subtitle: Text('Price: \$${realEstate.price}'),
        trailing: Icon(Icons.arrow_forward),
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
