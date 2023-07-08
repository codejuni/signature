import 'package:flutter/material.dart';
import 'package:signature/signature_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF222222),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF222222),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
        primaryColor: const Color(0xFFFFD740),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Nunito',
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Nunito',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Color(0xFF222222),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
      home: const SignatureScreen(),
    );
  }
}
