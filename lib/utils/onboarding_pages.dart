import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const ColumnWidget({super.key, required this.imagePath, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        const SizedBox(height: 50),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
          
        ),
      ],
    );
  }
}