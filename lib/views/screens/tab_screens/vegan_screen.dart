import 'package:flutter/material.dart';
import 'package:food_world/views/styles/font_styles.dart';

class VeganScreen extends StatefulWidget {
  const VeganScreen({super.key});

  @override
  State<VeganScreen> createState() => _VeganScreenState();
}

class _VeganScreenState extends State<VeganScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Vegan', style: FontStyles.textfieldText));
  }
}
