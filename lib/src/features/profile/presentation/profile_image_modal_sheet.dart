import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common_widgets/overlay_loader.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../utils/toastification.dart';
import 'profile_controller.dart';

Future<void> setProfileImage(BuildContext context, WidgetRef ref) async {
  return showModalBottomSheet(
      backgroundColor: tertiaryColor,
      context: context,
      builder: (context) {
        return DecoratedBox(
          decoration: const BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.all(Radius.circular(Sizes.p12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.photo_rounded,
                  color: primaryColor,
                ),
                title: const Text('Gallery'),
                onTap: () async {
                  final image = await ref
                      .read(profileControllerProvider.notifier)
                      .pickImage(ImageSource.gallery);
                  if (image == null) return;
                  showOverlayLoader(context);
                  final success = await ref
                      .read(profileControllerProvider.notifier)
                      .uploadImage(image);
                  context.pop();
                  if (success) {
                    successToast(
                      ctx: context,
                      title: 'Profile Image Updated',
                    );
                  }

                  context.pop();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera,
                  color: primaryColor,
                ),
                splashColor: primaryColor.withOpacity(0.2),
                title: const Text('Camera'),
                onTap: () async {
                  final image = await ref
                      .read(profileControllerProvider.notifier)
                      .pickImage(ImageSource.camera);
                  if (image == null) return;
                  showOverlayLoader(context);
                  final success = await ref
                      .read(profileControllerProvider.notifier)
                      .uploadImage(image);
                  context.pop();
                  if (success) {
                    successToast(
                      ctx: context,
                      title: 'Profile Image Updated',
                    );
                  }
                  context.pop();
                },
              ),
            ],
          ),
        );
      });
}
