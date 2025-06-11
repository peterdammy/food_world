import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_world/provider/food_carousel_provider.dart';
import 'package:food_world/views/styles/font_styles.dart';

class RecommendedCarousel extends ConsumerWidget {
  const RecommendedCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodCarouselContent = ref.watch(foodCarouselProvider);
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => 12.horizontalSpace,
        itemCount: foodCarouselContent.length,
        itemBuilder: (context, index) {
          return Container(
            height: 170.h,
            width: 280.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20).r,
              image: DecorationImage(
                image: AssetImage(foodCarouselContent[index].backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: SvgPicture.asset('assets/icon/favorite.svg'),
                  top: 10.h,
                  left: 10.w,
                ),
                Positioned(
                  left: 10.w,
                  bottom: 10.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodCarouselContent[index].foodTitle,
                        style: FontStyles.medium2Text(Colors.white),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Text(
                            foodCarouselContent[index].numberofMins,
                            style: FontStyles.smallerText(Colors.white),
                          ),
                          2.horizontalSpace,
                          Text(
                            "|",
                            style: FontStyles.smallestText(Colors.white),
                          ),
                          2.horizontalSpace,
                          Text(
                            foodCarouselContent[index].numberofServing,
                            style: FontStyles.smallerText(Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // return SizedBox(
  //   height: 180.h,
  //   child: ListView.separated(
  //     scrollDirection: Axis.horizontal,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         height: 160.h,
  //         width: 104.w,
  //         decoration: BoxDecoration(
  //           color: Theme.of(context).colorScheme.primary,
  //           borderRadius: BorderRadius.circular(20).r,
  //           image: DecorationImage(
  //             image: AssetImage(foodCarouselContent[index].backgroundImage),
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         child: Stack(
  //           children: [
  //             Positioned(
  //               child: SvgPicture.asset('assets/icon/favorite.svg'),
  //               top: 10.h,
  //               left: 10.w,
  //             ),
  //             Positioned(
  //               left: 7.w,
  //               bottom: 7.h,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     foodCarouselContent[index].foodTitle,
  //                     style: FontStyles.smallerBoldText(Colors.white),
  //                   ),
  //                   5.verticalSpace,
  //                   Row(
  //                     children: [
  //                       Text(
  //                         foodCarouselContent[index].numberofMins,
  //                         style: FontStyles.smallestText(Colors.white),
  //                       ),
  //                       2.horizontalSpace,
  //                       Text(
  //                         "|",
  //                         style: FontStyles.smallestText(Colors.white),
  //                       ),
  //                       2.horizontalSpace,
  //                       Text(
  //                         foodCarouselContent[index].numberofServing,
  //                         style: FontStyles.smallestText(Colors.white),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //     separatorBuilder: (context, index) => 12.horizontalSpace,
  //     itemCount: 6,
  //   ),
  // );
}
