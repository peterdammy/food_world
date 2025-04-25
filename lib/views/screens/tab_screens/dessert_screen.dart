import 'package:flutter/material.dart';
import 'package:food_world/views/styles/font_styles.dart';

class DessertScreen extends StatefulWidget {
  const DessertScreen({super.key});

  @override
  State<DessertScreen> createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Dessert', style: FontStyles.textfieldText));
  }
}
