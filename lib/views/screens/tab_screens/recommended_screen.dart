import 'package:flutter/material.dart';
import 'package:food_world/views/styles/font_styles.dart';

class RecommendedScreen extends StatefulWidget {
  const RecommendedScreen({super.key});

  @override
  State<RecommendedScreen> createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Recommended', style: FontStyles.textfieldText));
  }
}
