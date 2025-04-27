import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileModel {
  final SvgPicture profileOptionsIcon;
  final String profileOptionsTitle;
  final void Function(BuildContext context)? onPressed;

  ProfileModel({
    required this.profileOptionsIcon,
    required this.profileOptionsTitle,
    required this.onPressed,
  });
}
