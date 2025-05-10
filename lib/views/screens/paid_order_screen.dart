import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_world/views/screens/feedback_screen.dart';
import 'package:food_world/views/screens/home_screen.dart';
import 'package:food_world/views/styles/font_styles.dart';

class PaidOrderScreen extends ConsumerStatefulWidget {
  final double total;
  const PaidOrderScreen({super.key, required this.total});

  @override
  ConsumerState<PaidOrderScreen> createState() => _PaidOrderScreenState();
}

class _PaidOrderScreenState extends ConsumerState<PaidOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
          child: Column(
            children: [
              120.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 429,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        boxShadow: [
                          BoxShadow(offset: Offset(0, 4), blurRadius: 4.0.r),
                        ],
                        borderRadius: BorderRadius.circular(12).r,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                        child: Column(
                          children: [
                            60.verticalSpace,
                            Text(
                              'Payment Success',
                              style: FontStyles.medium2Text(
                                Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order ID',
                                  style: FontStyles.smallerText(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  '1618HO',
                                  style: FontStyles.smallText(
                                    Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            16.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pay',
                                  style: FontStyles.smallerText(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  "₹ ${widget.total.toStringAsFixed(2)}",
                                  style: FontStyles.smallText(
                                    Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            16.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pay Date',
                                  style: FontStyles.smallerText(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  'May 7, 2025',
                                  style: FontStyles.smallText(
                                    Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                            50.verticalSpace,
                            Text(
                              'Total Pay',
                              style: FontStyles.smallerText(
                                Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              '₹ ${widget.total.toStringAsFixed(2)}',
                              style: FontStyles.textfieldText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -80.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/images/tick.png',
                          // height: 80, // Make sure height fits the effect
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icon/feedback.svg'),
                    5.horizontalSpace,
                    Text('Give Feedback', style: FontStyles.loginhintText),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0).w,
        child: SizedBox(
          height: 50.h,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20).r,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text(
              'View Menu',
              style: FontStyles.smallboldText(
                Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
