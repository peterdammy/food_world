import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/firebase_options.dart';
import 'package:food_world/provider/theme_provider.dart';
import 'package:food_world/views/screens/entry_point.dart';
import 'package:food_world/views/styles/theme_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeStyle = ref.watch(themeProvider).themeMode;

    return ScreenUtilInit(
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food World',
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: themeStyle,

            home: const EntryPoint(),
          ),
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );
  }
}
