import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_world/provider/auth_provider.dart';
import 'package:food_world/provider/user_provider.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:food_world/views/widgets/personal_info_container_title.dart';
import 'package:food_world/views/widgets/personal_info_content.dart';
import 'package:food_world/views/widgets/username_textfield.dart';

final formKey = GlobalKey<FormState>();

class PersonalInfoScreen extends ConsumerStatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  ConsumerState<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends ConsumerState<PersonalInfoScreen> {
  bool _isObscured = true;

  InputCounterWidgetBuilder customBuilder =
      (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) => Text('$currentLength/$maxLength');

  final emailController = TextEditingController();
  final instagramController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final bioController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    instagramController.dispose();
    phoneController.dispose();
    locationController.dispose();
    bioController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isValidate = true;

  Future<void> validateUsername() async {
    final usernameMap =
        await FirebaseFirestore.instance.collection('users').get();
    final username = usernameMap.docs.map((user) => user).toList();
    String? availableUsername;

    for (var user in username) {
      if (instagramController.text == user.data()['instagramUsername']) {
        availableUsername = user.data()['instagramUsername'];
        isValidate = !isValidate;
        setState(() {});
      }
      if (instagramController.text != availableUsername) {
        isValidate = isValidate;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserAsync = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
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
                    16.horizontalSpace,
                    Text(
                      'Personal Information',
                      style: FontStyles.mediumText(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                currentUserAsync.when(
                  loading:
                      () =>
                          CircularProgressIndicator(), // or Shimmer if you prefer
                  error: (err, stack) => Text('Error loading user info'),
                  data:
                      (currentUser) => Row(
                        children: [
                          CircleAvatar(
                            radius: 50.r,
                            backgroundImage: AssetImage(
                              'assets/images/avatar.png',
                            ),
                          ),
                          20.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentUser.instagramUsername,
                                style: FontStyles.medium2Text(
                                  Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              5.verticalSpace,
                              Text(
                                currentUser.email ?? 'No email provided',
                                style: FontStyles.smallerBoldText(
                                  Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                ),

                30.verticalSpace,
                PersonalInfoContainerTitle(
                  controller: bioController,
                  customBuilder: customBuilder,
                  titleIcon: Icon(
                    Icons.info_outline,
                    color: Colors.orange.shade400,
                    size: 20.w,
                  ),
                  titleText: 'Bio',
                ),
                16.verticalSpace,
                PersonalInfoContent(
                  hintText: 'Select a verified email to display',
                  titleIcon: Icon(
                    Icons.email_outlined,
                    size: 20.h,
                    color: Colors.orange.shade400,
                  ),
                  titleText: 'Email',
                  obscureText: false,
                  controller: emailController,
                ),
                16.verticalSpace,
                UsernameTextfield(
                  controller: instagramController,
                  hintText: 'https://www.instagram.com/username/',
                  titleIcon: Icon(
                    Icons.email,
                    size: 20.h,
                    color: Colors.orange.shade400,
                  ),
                  titleText: 'Instagram Username',
                  obscureText: false,
                ),
                16.verticalSpace,
                PersonalInfoContent(
                  controller: phoneController,
                  hintText: 'xxxx-xxxx-xx',
                  titleIcon: Icon(
                    Icons.phone_outlined,
                    size: 20.h,
                    color: Colors.orange.shade400,
                  ),
                  titleText: 'Phone Number',
                  obscureText: false,
                ),
                16.verticalSpace,
                PersonalInfoContent(
                  controller: locationController,
                  hintText: 'Lagos',
                  titleIcon: Icon(
                    Icons.location_on_outlined,
                    size: 20.h,
                    color: Colors.orange.shade400,
                  ),
                  titleText: 'Location',
                  obscureText: false,
                ),
                16.verticalSpace,
                PersonalInfoContent(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  titleIcon: Icon(
                    Icons.key_outlined,
                    size: 20.h,
                    color: Colors.orange.shade400,
                  ),
                  titleText: 'Password',
                  obscureText: _isObscured,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      _isObscured
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20.h,
                      color: Colors.black,
                    ),
                  ),
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
                      final success = await ref
                          .read(authServiceProvider)
                          .addUserDataToFireStore(
                            email: emailController.text,
                            instagramUsername: instagramController.text,
                            phoneNumber: phoneController.text,
                            location: locationController.text,
                            bio: bioController.text,
                          );

                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("✅ Profile updated successfully"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("❌ Failed to update profile")),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.orange),
                    ),
                    child: Text(
                      'Save Changes',
                      style: FontStyles.mediumText(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),

                60.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
