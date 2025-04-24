import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/auth_provider.dart';
import 'package:food_world/views/screens/home_screen.dart';
import 'package:food_world/views/screens/onboard/onboard_screen.dart';
import 'package:food_world/views/styles/font_styles.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                52.verticalSpace,
                Text(
                  'Register',
                  style: FontStyles.largerText(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                16.verticalSpace,
                Container(
                  height: 224.h,
                  width: 298.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/onboardimage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                16.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email', style: FontStyles.textfieldText),
                    10.verticalSpace,
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.primary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    Text('Password', style: FontStyles.textfieldText),
                    10.verticalSpace,
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.primary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,
                Container(
                  height: 57.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(child: CircularProgressIndicator());
                        },
                      );

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill in both fields")),
                        );
                        return;
                      }

                      // if (password != confirmPassword) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("Passwords do not match")),
                      //   );
                      //   return;
                      // }

                      final errorMessage = await ref
                          .read(authServiceProvider)
                          .signUpWithEmail(email, password);

                      Navigator.pop(context);

                      if (errorMessage == null) {
                        // Success
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        // Show specific error message
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(errorMessage)));
                      }
                    },

                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    child: Text(
                      'Continue',
                      style: FontStyles.mediumText(
                        Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardScreen()),
                    );
                  },
                  child: Text(
                    'Have an account already? Click',
                    style: FontStyles.loginhintText,
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
