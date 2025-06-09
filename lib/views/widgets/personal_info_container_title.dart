import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:food_world/views/widgets/bio_container.dart';

class PersonalInfoContainerTitle extends StatelessWidget {
  final Icon titleIcon;
  final String titleText;
  final TextEditingController controller;
  const PersonalInfoContainerTitle({
    super.key,
    required this.customBuilder,
    required this.titleIcon,
    required this.titleText,
    required this.controller,
  });

  final InputCounterWidgetBuilder? customBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
      child: Column(
        children: [
          Row(
            children: [
              titleIcon,
              10.horizontalSpace,
              Text(
                titleText,
                style: FontStyles.medium2Text(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          BioContainer(customBuilder: customBuilder, controller: controller),
        ],
      ),
    );
  }
}
