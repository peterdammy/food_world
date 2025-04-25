import 'package:flutter/material.dart';
import 'package:food_world/views/styles/font_styles.dart';

class SandwichScreen extends StatefulWidget {
  const SandwichScreen({super.key});

  @override
  State<SandwichScreen> createState() => _SandwichScreenState();
}

class _SandwichScreenState extends State<SandwichScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Sandwich', style: FontStyles.textfieldText));
  }
}
