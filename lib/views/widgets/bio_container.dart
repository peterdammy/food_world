import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BioContainer extends StatelessWidget {
  const BioContainer({super.key, this.customBuilder, this.controller});

  final InputCounterWidgetBuilder? customBuilder;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        color: Theme.of(context).colorScheme.primary,
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding:
            const EdgeInsets.only(
              // left: 10.0,
              right: 10,
              bottom: 10,
            ).r,
        child: TextFormField(
          autocorrect: true,
          maxLines: null,
          maxLength: 200,
          keyboardType: TextInputType.multiline,
          buildCounter: customBuilder,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            hintText: 'Tell us a little about yourself',
            hintStyle: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
