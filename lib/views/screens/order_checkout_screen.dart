import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:food_world/views/widgets/payment_container.dart';

class OrderCheckoutScreen extends StatefulWidget {
  const OrderCheckoutScreen({super.key});

  @override
  State<OrderCheckoutScreen> createState() => _OrderCheckoutScreenState();
}

class _OrderCheckoutScreenState extends State<OrderCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
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
                    'Payment',
                    style: FontStyles.mediumText(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
              PaymentContainer(
                svgPicture: 'assets/icon/visacard.svg',
                svgPicture2: 'assets/icon/mastercard.svg',
              ),
              16.verticalSpace,
              PaymentContainer(
                svgPicture: 'assets/icon/googlepay.svg',
                svgPicture2: 'assets/icon/applepay.svg',
              ),
              16.verticalSpace,
              PaymentContainer(svgPicture: 'assets/icon/paypal.svg'),
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
            onPressed: () {},
            child: Text(
              'Continue',
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
