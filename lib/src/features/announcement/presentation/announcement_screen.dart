import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import '../data/announcement_repository.dart';

class AnnouncementScreen extends ConsumerWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: CustomCarouselSlider(
              value: ref.watch(fetchSlidersProvider(screen: 'Home Page')),
            ),
          ),
          gapH16,
          AsyncValueWidget(
            value: ref.watch(fetchAnnouncementProvider),
            data: (list) {
              return Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final announcement = list[index];
                      return Card(
                        color: tertiaryColor,
                        child: Column(
                          children: [
                            Text(announcement.title,
                                style: Theme.of(context).textTheme.titleLarge),
                            Text(
                              announcement.details,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: Sizes.p12),
                            ),
                          ],
                        ),
                      );
                    }),
              );
            },
            loading: Expanded(
              child: Skeletonizer(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Card(
                        child: Column(
                          children: [
                            Text('Hello world'),
                            Text('This is a test'),
                          ],
                        ),
                      );
                      // return const ListTile(
                      //   titleAlignment: ListTileTitleAlignment.center,
                      //   title: Text('Hello World'),
                      //   subtitle: Text('This is a test'),
                      // );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
