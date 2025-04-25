import 'package:flutter/material.dart';
import 'package:food_world/views/styles/font_styles.dart';

class JunkFoodScreen extends StatefulWidget {
  const JunkFoodScreen({super.key});

  @override
  State<JunkFoodScreen> createState() => _JunkFoodScreenState();
}

class _JunkFoodScreenState extends State<JunkFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Junk Food', style: FontStyles.textfieldText));
  }
}
