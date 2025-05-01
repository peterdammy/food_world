import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:food_world/views/widgets/recommended_carousel.dart';

class RecommendedScreen extends StatefulWidget {
  const RecommendedScreen({super.key});

  @override
  State<RecommendedScreen> createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {
  @override
  Widget build(BuildContext context) {
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
                    itemCount: 6,
                    separatorBuilder: (context, index) => 10.verticalSpace,
                    itemBuilder: (context, index) {
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'lorem ipsum dolor sit',
                                    style: FontStyles.smallestItalicText(
                                      Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    'Item 1',
                                    style: FontStyles.smallerBoldText(
                                      Theme.of(context).colorScheme.secondary,
                                    ),
                                  ),
                                  Text(
                                    '20.00₹',
                                    style: FontStyles.smallerText(Colors.green),
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
                                    CircleAvatar(
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
                                    Text(
                                      '1',
                                      style: FontStyles.smallerText(
                                        Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    CircleAvatar(
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
                                  ],
                                ),
                                10.horizontalSpace,
                                Container(
                                  height: 48.h,
                                  width: 92.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25).r,
                                    color: Colors.green,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Add',
                                      style: FontStyles.smallText(
                                        Theme.of(context).colorScheme.surface,
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
