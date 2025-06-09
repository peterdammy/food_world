import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/styles/font_styles.dart';

final formKey = GlobalKey<FormState>();

class UsernameTextfield extends StatefulWidget {
  final Icon titleIcon;
  final String titleText;
  final String hintText;
  final IconButton? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;

  const UsernameTextfield({
    super.key,
    required this.hintText,
    required this.titleIcon,
    required this.titleText,
    this.suffixIcon,
    required this.obscureText,
    required this.controller,
  });

  @override
  State<UsernameTextfield> createState() => _UsernameTextfieldState();
}

class _UsernameTextfieldState extends State<UsernameTextfield> {
  bool isValidate = true;

  Future<void> validateUsername() async {
    final usernameMap =
        await FirebaseFirestore.instance.collection('users').get();
    final username = usernameMap.docs.map((user) => user).toList();
    String? availableUsername;

    for (var user in username) {
      if (widget.controller.text == user.data()['instagramUsername']) {
        availableUsername = user.data()['instagramUsername'];
        isValidate = !isValidate;
        setState(() {});
      }
      if (widget.controller.text != availableUsername) {
        isValidate = isValidate;
        setState(() {});
      }
    }
  }

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
          Form(
            child: TextFormField(
              onChanged: (username) {
                validateUsername();
              },
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              validator: (username) {
                return isValidate ? null : "username already taken";
              },
              controller: widget.controller,
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
          ),
        ],
      ),
    );
  }
}
