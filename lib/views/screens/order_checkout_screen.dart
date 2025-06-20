import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/model/recent_order_model.dart';
import 'package:food_world/provider/auth_recent_order_provider.dart';
import 'package:food_world/provider/auth_user_provider.dart';
import 'package:food_world/provider/menu_quantity_provider.dart';
import 'package:food_world/provider/recent_order_provider.dart';
import 'package:food_world/provider/selected_provider.dart';
import 'package:food_world/views/screens/paid_order_screen.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:food_world/views/widgets/payment_container.dart';

class OrderCheckoutScreen extends ConsumerStatefulWidget {
  const OrderCheckoutScreen({super.key});

  @override
  ConsumerState<OrderCheckoutScreen> createState() =>
      _OrderCheckoutScreenState();
}

class _OrderCheckoutScreenState extends ConsumerState<OrderCheckoutScreen> {
  final deliveryCharge = 30.00;

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(menuProvider).where((e) => e.isAdded);
    final subtotal = cartItems.fold(
      0.0,
      (sum, e) => sum + (e.price * e.quantity),
    );
    final total = subtotal + deliveryCharge;

    final selectedIndex = ref.watch(selectedPaymentProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// AppBar
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
                        onPressed: () => Navigator.pop(context),
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
                    'Payment',
                    style: FontStyles.mediumText(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),

              30.verticalSpace,

              /// Payment Methods (selectable)
              GestureDetector(
                onTap:
                    () => ref.read(selectedPaymentProvider.notifier).state = 0,
                child: PaymentContainer(
                  svgPicture: 'assets/icon/visacard.svg',
                  svgPicture2: 'assets/icon/mastercard.svg',
                  isSelected: selectedIndex == 0,
                ),
              ),
              16.verticalSpace,
              GestureDetector(
                onTap:
                    () => ref.read(selectedPaymentProvider.notifier).state = 1,
                child: PaymentContainer(
                  svgPicture: 'assets/icon/googlepay.svg',
                  svgPicture2: 'assets/icon/applepay.svg',
                  isSelected: selectedIndex == 1,
                ),
              ),
              16.verticalSpace,
              GestureDetector(
                onTap:
                    () => ref.read(selectedPaymentProvider.notifier).state = 2,
                child: PaymentContainer(
                  svgPicture: 'assets/icon/paypal.svg',
                  svgPicture2: '',
                  isSelected: selectedIndex == 2,
                ),
              ),

              4.verticalSpace,
              TextButton(
                onPressed: () {},
                child: Text(
                  '+ Add other payment methods',
                  style: FontStyles.loginhintText,
                ),
              ),

              20.verticalSpace,

              /// Order Summary
              Container(
                height: 214.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Summary',
                        style: FontStyles.medium2Text(
                          Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item(s) Subtotal',
                            style: FontStyles.smallerBoldText(
                              Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          Text(
                            subtotal.toStringAsFixed(2),
                            style: FontStyles.smallerBoldText(
                              Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: FontStyles.smallerBoldText(
                              Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          Text(
                            deliveryCharge.toStringAsFixed(2),
                            style: FontStyles.smallerBoldText(
                              Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Divider(
                        thickness: 1.5.h,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: FontStyles.medium2Text(
                              Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          Text(
                            total.toStringAsFixed(2),
                            style: FontStyles.smallerBoldText(
                              Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /// Continue Button
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
              final user = ref.read(authUserProvider).value;
              if (user != null) {
                final orderId =
                    DateTime.now().millisecondsSinceEpoch.toString();
                final payDate = DateTime.now().toString().substring(0, 10);

                ref
                    .read(recentOrderProvider(user.uid).notifier)
                    .addRecentOrder(
                      RecentOrderModel(
                        orderId: orderId,
                        amount: total,
                        payDate: payDate,
                        isCompleted: true,
                      ),
                    );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaidOrderScreen(total: total),
                  ),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("User not signed in")));
              }
            },

            child: Text(
              'Pay',
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
