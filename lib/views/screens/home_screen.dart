import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/menu_quantity_provider.dart';
import 'package:food_world/views/screens/order_checkout_screen.dart';
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
          child: Stack(
            children: [
              // Main content
              SingleChildScrollView(
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
                              backgroundImage: AssetImage(
                                'assets/images/avatar.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      CustomTabBar(),
                      20.verticalSpace,
                      CustomTabContent(),
                    ],
                  ),
                ),
              ),

              // Bottom Sheet
              DraggableScrollableSheet(
                initialChildSize: 0.1, // collapsed size
                minChildSize: 0.1,
                maxChildSize: 0.5, // expanded size
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20).r,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Orders",
                              style: FontStyles.medium2Text(
                                Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            Icon(
                              Icons.expand_more,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                        12.verticalSpace,
                        ...ref
                            .watch(menuProvider)
                            .where((item) => item.isAdded)
                            .map(
                              (item) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.name,
                                      style: FontStyles.smallText(
                                        Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    Text(
                                      "${item.price.toStringAsFixed(2)} ₹",
                                      style: FontStyles.smallText(
                                        Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        16.verticalSpace,
                        Container(
                          height: 60.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total: ${ref.watch(menuProvider).where((e) => e.isAdded).fold(0.0, (sum, e) => sum + (e.price * e.quantity))} ₹",
                                style: FontStyles.medium2Text(
                                  Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => OrderCheckoutScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: Text(
                                  "Check Out",
                                  style: FontStyles.smallboldText(
                                    Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
