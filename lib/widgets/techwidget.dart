import 'package:flutter/material.dart';
import 'package:portfolio/models/tech.dart';

class TechWidget extends StatelessWidget {
  final TechInfo techInfo;

  const TechWidget({required this.techInfo});

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width > 600 ? 60 : 40;
    double textSize = MediaQuery.of(context).size.width > 600 ? 16 : 12;

    return Column(
      children: [
        Image.asset(
          techInfo.logoPath,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 3),
        Text(
          techInfo.name,
          style: TextStyle(
            fontSize: textSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
