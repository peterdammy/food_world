import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/screens/onboard/onboard_screen.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeOnboard extends StatefulWidget {
  const WelcomeOnboard({super.key});

  @override
  State<WelcomeOnboard> createState() => _WelcomeOnboardState();
}

class _WelcomeOnboardState extends State<WelcomeOnboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0).w,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0).h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    40.verticalSpace,
                    Container(
                      height: 300.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/onboardimage.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    Text(
                      'Welcome To Food World',
                      style: FontStyles.largeText(
                        Theme.of(context).colorScheme.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    20.verticalSpace,
                    Text(
                      "Skip the Wait. Tap, Order and Enjoy... \n It's that easy!",
                      style: FontStyles.smallerText(
                        Theme.of(context).colorScheme.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    100.verticalSpace,
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('hasSeenOnboarding', true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OnboardScreen(),
                        ),
                      );
                    },

                    child: Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20).r,
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: FontStyles.smallerText(
                            Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
