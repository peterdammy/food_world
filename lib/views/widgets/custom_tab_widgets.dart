import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/provider/custom_tab_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/styles/font_styles.dart';

class CustomTabBar extends ConsumerWidget {
  const CustomTabBar({super.key});

  final List<String> tabs = const [
    'Recommended',
    'Vegan',
    'Junk Food',
    'Beverages',
    'Sandwich',
    'Pizza',
    'Desserts',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTabProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.only(left: 12.w, bottom: 8.h),
            child: GestureDetector(
              onTap: () {
                ref.read(selectedTabProvider.notifier).state = index;
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? Colors.yellow
                          : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 4.r,
                      offset: Offset(0, 4),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
                child: Text(
                  tabs[index],
                  style: FontStyles.smallerBoldText(
                    isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
