import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentContainer extends StatelessWidget {
  final String svgPicture;
  String? svgPicture2;

  PaymentContainer({super.key, required this.svgPicture, this.svgPicture2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [BoxShadow(blurRadius: 4.r, offset: Offset(0, 4))],
      ),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
        leading: Container(
          height: 25.h,
          width: 25.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(25).r,
          ),
        ),
        title: Row(
          children: [
            SvgPicture.asset(svgPicture),
            10.horizontalSpace,
            SvgPicture.asset(svgPicture),
          ],
        ),
      ),
    );
  }
}
