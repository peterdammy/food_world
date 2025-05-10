import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/screens/home_screen.dart';
import 'package:food_world/views/styles/font_styles.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.verticalSpace,
              Text(
                'Order Completed',
                style: FontStyles.medium2Text(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              8.verticalSpace,
              Text(
                'Please give your feedback!',
                style: FontStyles.smallerText(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              36.verticalSpace,
              Container(
                height: 124.h,
                width: 124.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  color: Colors.yellow,
                  image: DecorationImage(
                    image: AssetImage('assets/images/feedbackavatar.png'),
                    fit: BoxFit.contain,
                  ),
                  boxShadow: [BoxShadow(offset: Offset(5, 5), blurRadius: 5.r)],
                ),
              ),
              36.verticalSpace,
              TextFormField(
                maxLines: 10,
                minLines: 5,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primary,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Give your feedback...',
                  hintStyle: FontStyles.smallerText(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              44.verticalSpace,
              SizedBox(
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
                    'Submit Feedback',
                    style: FontStyles.smallboldText(
                      Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't want to give feedback?",
                    style: FontStyles.smallerText(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: FontStyles.smallerBoldText(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
