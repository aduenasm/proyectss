import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String url;

  const IconContainer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: CircleAvatar(
        radius: 10.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(url),
      ),
    );
  }
}
