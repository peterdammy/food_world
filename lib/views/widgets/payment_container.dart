import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentContainer extends StatelessWidget {
  final String svgPicture;
  final String svgPicture2;
  final bool isSelected;

  const PaymentContainer({
    super.key,
    required this.svgPicture,
    required this.svgPicture2,
    required this.isSelected,
  });

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
            borderRadius: BorderRadius.circular(25).r,
            border: Border.all(
              color:
                  isSelected
                      ? Colors.green
                      : Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          child:
              isSelected
                  ? Icon(Icons.check, size: 18, color: Colors.green)
                  : null,
        ),
        title: Row(
          children: [
            SvgPicture.asset(svgPicture),
            if (svgPicture2.isNotEmpty) ...[
              10.horizontalSpace,
              SvgPicture.asset(svgPicture2),
            ],
          ],
        ),
      ),
    );
  }
}
