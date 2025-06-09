import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/auth_provider.dart';
import 'package:food_world/repo/internet_repo.dart';
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
                      enableSuggestions: true,
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
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.5.w,
                          ),
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    Text('Password', style: FontStyles.textfieldText),
                    10.verticalSpace,
                    TextFormField(
                      controller: passwordController,
                      enableSuggestions: true,
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
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.5.w,
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Have an account already? Click',
                        style: FontStyles.loginhintText,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
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

                      if (email.isEmpty ||
                          password.isEmpty ||
                          !email.contains('@') ||
                          password.length < 6) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            elevation: 2.h,
                            showCloseIcon: true,
                            closeIconColor: Colors.red,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            content: Text(
                              "Please fill in both fields",
                              style: FontStyles.loginhintText,
                            ),
                          ),
                        );
                        return;
                      }

                      // final internetAvailable = await connectedToInternet();
                      // if (!internetAvailable) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('No Internet Connection')),
                      //   );
                      // }

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
                        Navigator.pop(context);
                        // Success
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        // Show specific error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            elevation: 2.h,
                            showCloseIcon: true,
                            closeIconColor: Colors.red,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            content: Text(
                              errorMessage,
                              style: FontStyles.loginhintText,
                            ),
                          ),
                        );
                      }
                    },

                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    child: Text(
                      'Continue',
                      style: FontStyles.mediumText(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                16.verticalSpace,
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    );
                    final user =
                        await ref.read(authServiceProvider).signInWithGoogle();

                    Navigator.pop(context);

                    if (user != null) {
                      // Sign-in was successful
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      // Sign-in failed or canceled
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Google Sign-Up failed")),
                      );
                    }
                  },
                  child: Container(
                    height: 57.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5.w,
                      ),
                      borderRadius: BorderRadius.circular(20).r,
                    ),
                    child: Row(
                      children: [
                        20.horizontalSpace,
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40).r,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            'assets/images/google.png',
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        20.horizontalSpace,
                        Text(
                          'Sign Up with Google',
                          style: FontStyles.mediumText(
                            Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Text(
                  'By clicking continue, you agree to our Terms of Service and Privacy Policy',
                  style: FontStyles.loginhintText,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
