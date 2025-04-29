import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/theme_provider.dart';
import 'package:food_world/views/screens/profile_screen.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:food_world/views/widgets/custom_tab_content.dart';
import 'package:food_world/views/widgets/custom_tab_widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
            child: Column(
              children: [
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Guest',
                      style: FontStyles.medium2Text(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 26.r,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                CustomTabBar(),
                20.verticalSpace,
                CustomTabContent(),
                // TabBar(
                //   isScrollable: true,
                //   labelPadding:
                //       EdgeInsets.only(left: 16, bottom: 8, right: 12).r,
                //   tabAlignment: TabAlignment.start,
                //   tabs: [
                //     Text(
                //       'Recommended',
                //       style: FontStyles.smallText(
                //         Theme.of(context).colorScheme.secondary,
                //       ),
                //     ),
                //     Text(
                //       'Vegan',
                //       style: FontStyles.smallText(
                //         Theme.of(context).colorScheme.secondary,
                //       ),
                //     ),
                //     Text(
                //       'Junk Food',
                //       style: FontStyles.smallText(
                //         Theme.of(context).colorScheme.secondary,
                //       ),
                //     ),
                //     Text(
                //       'Beverages',
                //       style: FontStyles.smallText(
                //         Theme.of(context).colorScheme.secondary,
                //       ),
                //     ),
                //     Text(
                //       'Sandwich',
                //       style: FontStyles.smallText(
                //         Theme.of(context).colorScheme.secondary,
                //       ),
                //     ),
                //     Text(
                //       'Pizza',
                //       style: FontStyles.smallText(
                //         Theme.of(context).colorScheme.secondary,
                //       ),
                //     ),
                //     Text(
                //       'Desserts',
                //       style: FontStyles.smallText(
                //         Theme.of(context).colorScheme.secondary,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
