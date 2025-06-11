import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/auth_recent_order_provider.dart';
import 'package:food_world/provider/auth_user_provider.dart';
import 'package:food_world/views/styles/font_styles.dart';

class RecentOrder extends ConsumerWidget {
  const RecentOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(authUserProvider);
    // Check if the user is loading or not

    if (userAsync.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!userAsync.hasValue || userAsync.value == null) {
      return const Scaffold(body: Center(child: Text("Not signed in")));
    }

    final uid = userAsync.value!.uid;
    final recentOrder = ref.watch(recentOrderProvider(uid));

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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child:
                      recentOrder.isEmpty
                          ? Center(
                            child: Text(
                              "No recent orders yet.",
                              style: FontStyles.smallText(
                                Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          )
                          : ListView.separated(
                            itemCount: recentOrder.length,
                            padding: const EdgeInsets.all(16),
                            separatorBuilder:
                                (context, index) => SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final recentOrders = recentOrder[index];

                              return Dismissible(
                                key: Key(recentOrders.orderId),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  color: Colors.red,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                onDismissed: (_) {
                                  ref
                                      .read(recentOrderProvider(uid).notifier)
                                      .deleteRecentOrder(recentOrders.orderId);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Deleted')),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order ID',
                                            style: FontStyles.smallText(
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                          ),
                                          4.verticalSpace,
                                          Text(
                                            'Pay',
                                            style: FontStyles.smallText(
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                          ),
                                          4.verticalSpace,
                                          Text(
                                            'Pay Date',
                                            style: FontStyles.smallText(
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                recentOrders.orderId,
                                                style: FontStyles.smallText(
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.secondary,
                                                ),
                                              ),
                                              2.verticalSpace,
                                              Text(
                                                '₹ ${recentOrders.amount.toStringAsFixed(2)}',
                                                style: FontStyles.smallText(
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.secondary,
                                                ),
                                              ),
                                              2.verticalSpace,
                                              Text(
                                                recentOrders.payDate,
                                                style: FontStyles.smallText(
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.secondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        recentOrders.isCompleted
                                            ? Icons.check_circle
                                            : Icons.refresh,
                                        color:
                                            recentOrders.isCompleted
                                                ? Colors.green
                                                : Colors.amber,
                                        size: 28,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
