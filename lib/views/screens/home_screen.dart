import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/food_carousel_provider.dart';
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
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  bool _isExpanded = false;

  void _toggleSheet() {
    if (_isExpanded) {
      _sheetController.animateTo(
        0.1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _sheetController.animateTo(
        0.5,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodCarouselContent = ref.watch(foodCarouselProvider).toSet();

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
                controller: _sheetController,
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 0.5,
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
                                Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isExpanded
                                    ? Icons.expand_more
                                    : Icons.expand_less, // Toggle icon
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              onPressed: _toggleSheet,
                            ),
                          ],
                        ),
                        12.verticalSpace,
                        ...ref
                            .watch(menuProvider)
                            .asMap()
                            .entries
                            .where((entry) => entry.value.isAdded)
                            .map((entry) {
                              final index = entry.key;
                              final item = entry.value;

                              // Get food title from foodCarouselProvider by index
                              final foodTitle =
                                  ref.watch(foodCarouselProvider).length > index
                                      ? ref
                                          .watch(foodCarouselProvider)[index]
                                          .foodTitle
                                      : 'Food Item';

                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      foodTitle,
                                      style: FontStyles.smallText(
                                        Theme.of(context).colorScheme.surface,
                                      ),
                                    ),
                                    Text(
                                      "${(item.price * item.quantity).toStringAsFixed(2)} ₹",
                                      style: FontStyles.smallText(
                                        Theme.of(context).colorScheme.surface,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
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
                                "Total: ${ref.watch(menuProvider).where((e) => e.isAdded).fold(0.0, (sum, e) => sum + (e.price * e.quantity)).toStringAsFixed(2)} ₹",
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
                                    Theme.of(context).colorScheme.surface,
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
