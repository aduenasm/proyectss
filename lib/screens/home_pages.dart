// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:turisteandogt/screens/login_screen.dart';
import 'package:turisteandogt/screens/registration_screen.dart';

class IconContainer extends StatelessWidget {
  final String url;

  const IconContainer({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100.0,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(url),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color(0xffB81736),
            Color(0xff281537),
          ]),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 50.0,
          ),
          children: <Widget>[
            Column(
              children: [
                const IconContainer(
                  url: 'images/mundo.jpg',
                ),
                const SizedBox(height: 20),
                const Text(
                  'TURISTEANDO GT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120.0, vertical: 12.0),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120.0, vertical: 12.0),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
