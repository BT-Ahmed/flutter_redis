import 'package:flutter/material.dart';
import 'package:flutter_redis/services/real_estate_service.dart';
import 'package:provider/provider.dart';
import 'view_models/real_estate_list_view_model.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RealEstateListViewModel(realEstateService: RealEstateService()),
        ),
        // Add other providers here if necessary
      ],
      child: MaterialApp(
        title: 'Real Estate App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
        // Define routes if necessary
      ),
    );
  }
}
