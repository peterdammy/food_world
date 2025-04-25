import 'package:flutter/material.dart';
import 'package:food_world/views/styles/font_styles.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Pizza', style: FontStyles.textfieldText));
  }
}
