import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/provider/custom_tab_provider.dart';
import 'package:food_world/views/screens/tab_screens/beverages_screen.dart';
import 'package:food_world/views/screens/tab_screens/dessert_screen.dart';
import 'package:food_world/views/screens/tab_screens/junk_food_screen.dart';
import 'package:food_world/views/screens/tab_screens/pizza_screen.dart';
import 'package:food_world/views/screens/tab_screens/recommended_screen.dart';
import 'package:food_world/views/screens/tab_screens/sandwich_screen.dart';
import 'package:food_world/views/screens/tab_screens/vegan_screen.dart';

class CustomTabContent extends ConsumerWidget {
  const CustomTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectedTabProvider);

    final List<Widget> tabContents = [
      RecommendedScreen(),
      VeganScreen(),
      JunkFoodScreen(),
      BeveragesScreen(),
      SandwichScreen(),
      PizzaScreen(),
      DessertScreen(),
    ];

    return tabContents[index];
  }
}
