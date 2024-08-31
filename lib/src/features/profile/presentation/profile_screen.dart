import 'package:flutter/material.dart';

import '../../../common_widgets/network_photo.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          child: Text('Profile'.hardcoded),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Sizes.p48,
              width: Sizes.p48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2),
              ),
              child: const NetworkPhoto('https://i.pravatar.cc/150'),
            ),
            gapH24,
            ListTile(
              leading: const Icon(
                Icons.verified_user,
              ),
              title: Text('John Doe'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.email_rounded,
              ),
              title: Text('johndoe@gmail.com'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
              ),
              title: Text('+8801712358234'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.password,
              ),
              title: Text('***********'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.location_on,
              ),
              title: Text('Sirajgonj, Bangladesh'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
              ),
              title: Text('Log Out'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}
