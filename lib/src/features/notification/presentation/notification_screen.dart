import 'package:flutter/material.dart';

import '../../../common_widgets/network_photo.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';

class NotificationScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
      body: ListView.builder(
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
    );
  }
}
