import 'package:flutter/material.dart';
import 'package:turisteandogt/screens/home_pages.dart';
import 'screens/registration_screen.dart';
import 'screens/home_screen.dart';
import 'screens/trip_creation_screen.dart';

void main() {
  runApp(const TuristeandoGTApp());
}

class TuristeandoGTApp extends StatelessWidget {
  const TuristeandoGTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turisteando GT',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF4CAF50),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF4CAF50),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
        '/startTrip': (context) => TripCreationScreen(),
      },
    );
  }
}
