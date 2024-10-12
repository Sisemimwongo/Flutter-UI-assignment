import 'package:flutter/material.dart';
import 'send_money_page.dart'; // Import your Send Money page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Money App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor:
            Colors.deepPurple, // Main primary color for app (buttons, app bar)

        // Use colorScheme for secondary color (accent color replacement)
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orangeAccent, // Accent color for highlights
        ),
        scaffoldBackgroundColor:
            Colors.grey[200], // Background color for all pages

        // Define the default font family
        fontFamily: 'Roboto',

        // Define default text themes
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple), // headline1 equivalent
          titleLarge: TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.normal), // headline6 equivalent
          bodyMedium: TextStyle(
              fontSize: 14.0, color: Colors.black87), // bodyText2 equivalent
        ),

        // Elevated Button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.deepPurple, // Use backgroundColor instead of primary
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
          ),
        ),

        // Input decoration theme for form fields
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelStyle: TextStyle(color: Colors.deepPurple),
        ),

        // Switch theme
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.deepPurple),
          trackColor: MaterialStateProperty.all(Colors.deepPurple[100]),
        ),
      ),
      home: SendMoneyPage(), // Set the Send Money page as the home page
    );
  }
}
