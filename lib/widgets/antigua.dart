import 'package:flutter/material.dart';

class AntiguaImageWidget extends StatelessWidget {
  final String imagePath;
  final String destinationName;

  const AntiguaImageWidget({
    Key? key,
    required this.imagePath,
    required this.destinationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover, // Cubre todo el espacio del contenedor
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        destinationName,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
