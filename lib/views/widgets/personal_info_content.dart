import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/styles/font_styles.dart';

class PersonalInfoContent extends StatefulWidget {
  final Icon titleIcon;
  final String titleText;
  final String hintText;
  final IconButton? suffixIcon;
  final bool obscureText;

  const PersonalInfoContent({
    super.key,
    required this.hintText,
    required this.titleIcon,
    required this.titleText,
    this.suffixIcon,
    required this.obscureText,
  });

  @override
  State<PersonalInfoContent> createState() => _PersonalInfoContentState();
}

class _PersonalInfoContentState extends State<PersonalInfoContent> {
  // bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
      child: Column(
        children: [
          Row(
            children: [
              widget.titleIcon,
              10.horizontalSpace,
              Text(
                widget.titleText,
                style: FontStyles.medium2Text(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          TextField(
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              filled: true,

              fillColor: Theme.of(context).colorScheme.primary,
              suffixIcon: widget.suffixIcon,

              // suffixIcon: GestureDetector(
              //   onTap: () {
              //     Icon(
              //       isObscured
              //           ? Icons.visibility_outlined
              //           : Icons.visibility_off_outlined,
              //     );
              //   },
              // ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10).r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
