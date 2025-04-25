import 'package:flutter/material.dart';
import 'package:food_world/views/styles/font_styles.dart';

class BeveragesScreen extends StatefulWidget {
  const BeveragesScreen({super.key});

  @override
  State<BeveragesScreen> createState() => _BeveragesScreenState();
}

class _BeveragesScreenState extends State<BeveragesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Beverages', style: FontStyles.textfieldText));
  }
}
