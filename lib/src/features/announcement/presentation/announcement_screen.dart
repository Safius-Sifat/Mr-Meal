import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../../common_widgets/error.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../constants/texts.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import '../data/announcement_repository.dart';

class AnnouncementScreen extends ConsumerWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliders = ref.watch(fetchSlidersProvider(screen: announcementParam));
    final announcements = ref.watch(fetchAnnouncementProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('My Announcements'.hardcoded),
        ),
      ),
      body: sliders.hasError || announcements.hasError
          ? ErrorScreen(onRetry: () {
              ref.invalidate(fetchSlidersProvider(screen: announcementParam));
              ref.invalidate(fetchAnnouncementProvider);
            })
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
                child: Column(
                  children: [
                    CustomCarouselSlider(value: sliders),
                    gapH16,
                    AsyncValueWidget(
                      value: announcements,
                      data: (list) {
                        return Column(
                            children: List.generate(list.length, (index) {
                          final announcement = list[index];
                          return Card(
                            color: tertiaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(announcement.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  gapH8,
                                  HtmlWidget(
                                    announcement.details,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }));
                      },
                      loading: Skeletonizer(
                        child: Column(
                          children: List.generate(2, (index) {
                            return SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Card(
                                color: Colors.grey.shade100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      gapH24,
                                      const Text(
                                        'Hello world, this is a test lorem ipsum',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      gapH16,
                                      Text(
                                        loremIpsum.substring(0, 100),
                                        textAlign: TextAlign.center,
                                      ),
                                      gapH8,
                                      Text(
                                        loremIpsum.substring(0, 100),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
