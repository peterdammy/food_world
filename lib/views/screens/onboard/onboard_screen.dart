import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/provider/auth_provider.dart';
import 'package:food_world/repo/internet_repo.dart';
import 'package:food_world/views/screens/home_screen.dart';
import 'package:food_world/views/screens/onboard/register_screen.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardScreen extends ConsumerStatefulWidget {
  const OnboardScreen({super.key});

  @override
  ConsumerState<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends ConsumerState<OnboardScreen> {
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
                  'Welcome',
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
                    Text('Username', style: FontStyles.textfieldText),
                    10.verticalSpace,
                    TextFormField(
                      controller: emailController,
                      cursorColor: Theme.of(context).colorScheme.secondary,
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
                      cursorColor: Theme.of(context).colorScheme.secondary,
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
                    10.verticalSpace,
                    Text(
                      'Forgot Password? Need help sign in',
                      style: FontStyles.loginhintText,
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

                      // Check if empty
                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill in both fields")),
                        );
                        return;
                      }

                      final user = await ref
                          .read(authServiceProvider)
                          .signInWithEmail(email, password);

                      // Navigate on success
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid email or password")),
                        );

                        Navigator.pop(context);
                      }
                    },

                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    child: Text(
                      'Login',
                      style: FontStyles.mediumText(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Container(
                  height: 57.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },

                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    child: Text(
                      'Register',
                      style: FontStyles.mediumText(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
