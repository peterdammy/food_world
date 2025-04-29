import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/faq_provider.dart';
import 'package:food_world/provider/faq_state_change_provider.dart';
import 'package:food_world/views/styles/font_styles.dart';

class FaqScreen extends ConsumerStatefulWidget {
  const FaqScreen({super.key});

  @override
  ConsumerState<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends ConsumerState<FaqScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final faqContent = ref.watch(faqPageContentProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

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
                  50.horizontalSpace,
                  Text(
                    'FAQ',
                    style: FontStyles.mediumText(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => 10.verticalSpace,
                    itemCount: faqContent.length,
                    itemBuilder: (context, index) {
                      final isExpanded =
                          ref.watch(faqExpansionProvider)[index] ?? false;

                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 16).w,
                            childrenPadding:
                                EdgeInsets.symmetric(horizontal: 16).w,
                            onExpansionChanged: (bool expanded) {
                              ref
                                  .read(faqExpansionProvider.notifier)
                                  .toggleExpansion(index);
                            },
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            title: Text(
                              faqContent[index].faqTitle,
                              style: FontStyles.smallboldText(
                                Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            trailing: Icon(
                              isExpanded ? Icons.horizontal_rule : Icons.add,
                              size: 15.w,
                            ),
                            iconColor: Colors.green,
                            collapsedIconColor: Colors.green,
                            children: [
                              Text(
                                faqContent[index].faqContent,
                                style: FontStyles.smallerText(
                                  Theme.of(context).colorScheme.secondary,
                                ),
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
