import 'package:flutter/material.dart';

class QuetzalImageWidget extends StatelessWidget {
  final String imagePath;

  const QuetzalImageWidget({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle, // Forma circular
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
    );
  }
}
