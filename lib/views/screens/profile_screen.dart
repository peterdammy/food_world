import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_world/provider/auth_provider.dart';
import 'package:food_world/provider/auth_user_provider.dart';
import 'package:food_world/provider/profile_provider.dart';
import 'package:food_world/provider/theme_provider.dart';
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
    final themeNotifier = ref.watch(themeProvider);
    final isDarkMode = themeNotifier.themeMode == ThemeMode.dark;
    final userEmail = ref.watch(authUserProvider).value;
    final profileOptionsList = ref.watch(profileOptionsProvider);

    void _showLogoutDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green,
            title: Text(
              'You Sure You want to Logout',
              style: FontStyles.medium2Text(
                Theme.of(context).colorScheme.surface,
              ),
            ),
            content: Text(
              'We will miss your hunger',
              style: FontStyles.smallText(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20).r, // Rounded edges
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ref.read(authServiceProvider).signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardScreen()),
                  );
                },
                child: Text(
                  'Yes',
                  style: FontStyles.smallText(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: FontStyles.smallText(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

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
                  Container(
                    height: 55.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22).r,
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(offset: Offset(0, 4), blurRadius: 4.r),
                      ],
                    ),
                    child: Center(
                      child: IconButton(
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
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      return _showLogoutDialog(context);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icon/logout.svg'),
                        4.horizontalSpace,
                        Text(
                          'Log Out',
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
              50.verticalSpace,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    // borderRadius: BorderRadius.circular(12).r,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemCount: profileOptionsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          profileOptionsList[index].onPressed?.call(context);
                        },
                        child: ListTile(
                          leading: Container(
                            height: 55.h,
                            width: 55.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20).r,
                              color: Colors.orange[100],
                            ),
                            child: Center(
                              child:
                                  profileOptionsList[index].profileOptionsIcon,
                            ),
                          ),
                          title: Text(
                            profileOptionsList[index].profileOptionsTitle,
                            style: FontStyles.smallText(
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 16.h,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        'Switch Mode',
                        style: FontStyles.smallerText(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Switch(
                      value: isDarkMode,
                      onChanged: (value) async {
                        ref.read(themeProvider.notifier).toggleTheme();
                      },
                    ),
                  ],
                ),
              ),
              // ListView.separated(
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       leading: Container(
              //         height: 55.h,
              //         width: 55.w,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20).r,
              //           color: Colors.orange[600],
              //         ),
              //         child: Center(
              //           child: SvgPicture.asset('assets/icon/message.svg'),
              //         ),
              //       ),
              //     );
              //   },
              //   separatorBuilder: (context, index) => 16.verticalSpace,
              //   itemCount: 4,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
