import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_world/provider/auth_provider.dart';
import 'package:food_world/provider/auth_user_provider.dart';
import 'package:food_world/views/screens/onboard/onboard_screen.dart';
import 'package:food_world/views/styles/font_styles.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userEmail = ref.watch(authUserProvider).value;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 24.h,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      ref.read(authServiceProvider).signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icon/logout.svg'),
                        Text(
                          'Logout',
                          style: FontStyles.mediumText(Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              CircleAvatar(
                radius: 85.r,
                backgroundColor: Colors.transparent,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 77.r,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    Positioned(
                      right: 4.w,
                      bottom: 8.h,
                      child: SvgPicture.asset('assets/icon/edit.svg'),
                    ),
                  ],
                ),
              ),
              8.verticalSpace,
              Text(
                'Guest',
                style: FontStyles.medium2Text(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              4.verticalSpace,
              Text(
                userEmail?.email ?? '',
                style: FontStyles.smallerText(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
