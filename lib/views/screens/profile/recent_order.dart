import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/styles/font_styles.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCompleted = true;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
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
                  30.horizontalSpace,
                  Text(
                    'Recent Orders',
                    style: FontStyles.mediumText(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: ListTile(
                  leading: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Order ID',
                        style: FontStyles.smallerText(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),

                      Text(
                        'Pay',
                        style: FontStyles.smallerText(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),

                      Text(
                        'Pay Date',
                        style: FontStyles.smallerText(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.verified, color: Colors.green, size: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
