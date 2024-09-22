import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/network_photo.dart';
import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../routing/app_router.dart';
import '../../authentication/data/auth_repository.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(authRepositoryProvider).currentUser;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 50,
                            width: 50,
                            child: ClipOval(
                                child:
                                    NetworkPhoto('https://i.pravatar.cc/150')),
                          ),
                          gapW12,
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(currentUser!.name),
                              Text(currentUser.phone),
                              Text(currentUser.email),
                            ],
                          )
                        ],
                      ),
                      gapH12,
                      PrimaryButton(
                        height: 30,
                        width: 100,
                        fontSize: 8,
                        text: 'Change Password',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Container(
                      width: 2,
                      height: 70,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('My wallet - 1000 BDT'.hardcoded),
                      Text('My point - 1000 p'.hardcoded),
                      gapH12,
                      PrimaryButton(
                        height: 30,
                        width: 70,
                        fontSize: 8,
                        text: 'Recharge now',
                        onPressed: () {},
                      ),
                      gapH8,
                      PrimaryButton(
                        height: 30,
                        width: 70,
                        fontSize: 8,
                        text: 'Earn point',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            gapH24,
            ListTile(
              leading: const Icon(
                Icons.verified_user,
              ),
              title: Text('My Wallet'.hardcoded),
              onTap: () {
                context.goNamed(AppRoute.wallet.name);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.email_rounded,
              ),
              onTap: () {
                context.goNamed(AppRoute.myReport.name);
              },
              title: Text('Recharge History'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
              ),
              title: Text('My Invoice'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.location_on,
              ),
              title: Text('Set Location'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: Text('Complain & Feedback'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.rule_folder,
              ),
              title: Text('Refer & Earn'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.quick_contacts_dialer,
              ),
              title: Text('Terms & Condition'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: Text('Settings'.hardcoded),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
              ),
              title: Text('Logout'.hardcoded),
              onTap: () async {
                await ref.read(authRepositoryProvider).signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
