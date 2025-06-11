import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/food_carousel_provider.dart';
import 'package:food_world/provider/menu_quantity_provider.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:food_world/views/widgets/recommended_carousel.dart';

class RecommendedScreen extends ConsumerStatefulWidget {
  const RecommendedScreen({super.key});

  @override
  ConsumerState<RecommendedScreen> createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends ConsumerState<RecommendedScreen> {
  @override
  Widget build(BuildContext context) {
    final foodCarouselContent = ref.watch(foodCarouselProvider);

    final menuItems = ref.watch(menuProvider);
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            RecommendedCarousel(),
            30.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu',
                  style: FontStyles.medium2Text(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                16.verticalSpace,
                SizedBox(
                  height: 600.h,
                  child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (context, index) => 10.verticalSpace,
                    itemBuilder: (context, index) {
                      final menu = menuItems[index];
                      return Container(
                        height: 65.h,
                        margin: EdgeInsets.symmetric(vertical: 6.h),
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r,
                          color: Theme.of(context).colorScheme.surface,
                          boxShadow: [
                            BoxShadow(offset: Offset(5, 5), blurRadius: 5.r),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25.r,
                                    backgroundImage: AssetImage(
                                      foodCarouselContent[index]
                                          .backgroundImage,
                                    ),
                                  ),
                                  10.horizontalSpace,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Text(
                                      //   'lorem ipsum dolor sit',
                                      //   style: FontStyles.smallestItalicText(
                                      //     Theme.of(context).colorScheme.primary,
                                      //   ),
                                      // ),
                                      Text(
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        foodCarouselContent[index].foodTitle,
                                        style: FontStyles.smallerBoldText(
                                          Theme.of(
                                            context,
                                          ).colorScheme.secondary,
                                        ),
                                      ),
                                      Text(
                                        "${menu.price.toStringAsFixed(2)} ₹",
                                        style: FontStyles.smallerText(
                                          Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(menuProvider.notifier)
                                            .increaseQuantity(index);
                                      },

                                      child: CircleAvatar(
                                        radius: 6.5.r,
                                        backgroundColor:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                        child: Icon(
                                          Icons.add,
                                          size: 8.w,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      '${menu.quantity}',
                                      style: FontStyles.smallerText(
                                        Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(menuProvider.notifier)
                                            .decreaseQuantity(index);
                                      },
                                      child: CircleAvatar(
                                        radius: 6.5.r,
                                        backgroundColor:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                        child: Icon(
                                          Icons.remove,
                                          size: 8.w,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                10.horizontalSpace,
                                GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(menuProvider.notifier)
                                        .toggleAddToCart(index);
                                  },
                                  child: Container(
                                    height: 48.h,
                                    width: 92.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25).r,
                                      color:
                                          menu.isAdded
                                              ? Colors.red
                                              : Colors.green,
                                    ),
                                    child: Center(
                                      child: Text(
                                        menu.isAdded ? 'Remove' : 'Add',
                                        style: FontStyles.smallText(
                                          Theme.of(context).colorScheme.surface,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
