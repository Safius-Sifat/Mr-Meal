import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/network_photo.dart';
import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';

class NotificationScreen extends ConsumerWidget {
  NotificationScreen({super.key});

  final notification = [
    {
      'image':
          'https://meals.dotprogrammers.com/public/storage/items/1722697657Rectangle 35.png',
      'text': 'Package from your order #123343 has arrived',
      'time': '9:35 AM'
    },
    {
      'image':
          'https://meals.dotprogrammers.com/public/storage/items/1722697657Rectangle 35.png',
      'text': 'Package from your order #123343 has arrived',
      'time': '9:35 AM'
    },
    {
      'image':
          'https://meals.dotprogrammers.com/public/storage/items/1722697657Rectangle 35.png',
      'text': 'Package from your order #123343 has arrived',
      'time': '9:35 AM'
    }
  ];

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
          child: Text('My Notification'.hardcoded),
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.p20),
        child: PrimaryButton(
          onPressed: () {},
          width: 120,
          height: 40,
          text: 'Clear All'.hardcoded,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: CustomCarouselSlider(
              value: ref.watch(fetchSlidersProvider),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: notification.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: NetworkPhoto(notification[index]['image']!),
                    title: Text(notification[index]['text']!),
                    trailing: Column(
                      children: [
                        Text(notification[index]['time']!,
                            style: TextStyle(color: Colors.black45)),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
