import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart'; // Import your home screen

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      theme: ThemeData(
        // Define your app's color scheme, font, etc.
        primarySwatch: Colors.red, // Example primary color
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(), // Your app's home screen
      // Define other properties like routes, onGenerateRoute, etc., as needed
    );
  }
}
