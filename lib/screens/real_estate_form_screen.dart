import 'package:flutter/material.dart';
import '../models/real_estate.dart';
import '../view_models/real_estate_view_model.dart';
import 'package:provider/provider.dart';
import '../models/real_estate_category.dart';
import '../models/real_estate_listing_type.dart';

class RealEstateFormScreen extends StatefulWidget {
  final RealEstate? realEstate;

  RealEstateFormScreen({super.key, this.realEstate});

  @override
  _RealEstateFormScreenState createState() => _RealEstateFormScreenState();
}

class _RealEstateFormScreenState extends State<RealEstateFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _roomsCountController;
  late TextEditingController _bathroomsCountController;
  late TextEditingController _surfaceController;
  late TextEditingController _cityController;
  late TextEditingController _regionController;
  late RealEstateCategory _selectedCategory;
  late RealEstateListingType _selectedListingType;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.realEstate?.title ?? '');
    _priceController =
        TextEditingController(text: widget.realEstate?.price.toString() ?? '');
    _roomsCountController = TextEditingController(
        text: widget.realEstate?.roomsCount.toString() ?? '');
    _bathroomsCountController = TextEditingController(
        text: widget.realEstate?.bathroomsCount.toString() ?? '');
    _surfaceController = TextEditingController(
        text: widget.realEstate?.surface.toString() ?? '');
    _cityController =
        TextEditingController(text: widget.realEstate?.city ?? '');
    _regionController =
        TextEditingController(text: widget.realEstate?.region ?? '');
    _selectedCategory =
        widget.realEstate?.category ?? RealEstateCategory.apartments;
    _selectedListingType =
        widget.realEstate?.listingType ?? RealEstateListingType.forSale;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _roomsCountController.dispose();
    _bathroomsCountController.dispose();
    _surfaceController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final realEstate = RealEstate(
        id: widget.realEstate?.id ?? 0,
        // Assign a unique ID for new entries
        title: _titleController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        roomsCount: int.tryParse(_roomsCountController.text) ?? 0,
        bathroomsCount: int.tryParse(_bathroomsCountController.text) ?? 0,
        surface: double.tryParse(_surfaceController.text) ?? 0.0,
        city: _cityController.text,
        region: _regionController.text,
        category: _selectedCategory,
        listingType: _selectedListingType,
      );

      if (widget.realEstate == null) {
        Provider.of<RealEstateViewModel>(context, listen: false).addRealEstate(
            realEstate);
      } else {
        Provider.of<RealEstateViewModel>(context, listen: false)
            .updateRealEstate(realEstate);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.realEstate == null ? 'Add Real Estate' : 'Edit Real Estate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
            TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _roomsCountController,
            decoration: const InputDecoration(labelText: 'Number of Rooms'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the number of rooms';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _bathroomsCountController,
            decoration: const InputDecoration(labelText: 'Number of Bathrooms'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the number of bathrooms';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _surfaceController,
            decoration: const InputDecoration(labelText: 'Surface (sqm)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the surface area';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _cityController,
            decoration: const InputDecoration(labelText: 'City'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a city';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _regionController,
            decoration: const InputDecoration(labelText: 'Region'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a region';
              }
              return null;
            },
          ),
          DropdownButtonFormField<RealEstateCategory>(
            value: _selectedCategory,
            decoration: const InputDecoration(labelText: 'Category'),
            items: RealEstateCategory.values.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category
                    .toString()
                    .split('.')
                    .last),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedCategory = newValue!;
              });
            },
          ),
          DropdownButtonFormField<RealEstateListingType>(
            value: _selectedListingType,
            decoration: const InputDecoration(labelText: 'Listing Type'),
            items: RealEstateListingType.values.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type
                    .toString()
                    .split('.')
                    .last),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedListingType = newValue!;
              });
            },
          ),
          Container(
            margin: const EdgeInsets.only(top:12.0),
            child: ElevatedButton(
              onPressed: _saveForm,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                    double.infinity, 50), // make button width full and height 50
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(Icons.save), SizedBox(width:6), Text('Save Real Estate')],
              ),
            ),
          )],
          ),
        ),
      ),
    );
  }
}
