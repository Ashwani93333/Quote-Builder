import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_builder/views/QuoteForm_Screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF000000), // Dark background
        colorScheme: ColorScheme.dark(
          primary: Colors.amber[600]!, // Button color from video
          secondary: Colors.amber[600]!,
          background: const Color(0xFF2D2D3E),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white, height: 2.0),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white60),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber[600], // Button color
            foregroundColor: Colors.black, // Text on button
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: QuoteFormScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
