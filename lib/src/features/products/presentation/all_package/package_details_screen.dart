import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../data/item_repository.dart';
import '../home/carousel_slider.dart';
import '../widgets/notification_widget.dart';
import '../widgets/photo.dart';
import '../widgets/primary_button.dart';

class PackageDetailScreen extends ConsumerWidget {
  const PackageDetailScreen({super.key});

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
          child: const Text('Our Package Details'),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          child: Column(
            children: [
              CustomCarouselSlider(
                value: ref.watch(fetchSlidersProvider),
              ),
              gapH12,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(Sizes.p16),
                      decoration: BoxDecoration(
                        color: neutralColor,
                        border: Border.all(color: tertiaryColor),
                        borderRadius: BorderRadius.circular(Sizes.p32),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.p12, vertical: Sizes.p8),
                            decoration: BoxDecoration(
                                color: tertiaryColor,
                                borderRadius: BorderRadius.circular(Sizes.p24)),
                            child: Center(
                              child: Text(
                                'Package Info',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          gapH8,
                          const AspectRatio(
                              aspectRatio: 1.5, child: Photo(pilaf)),
                          gapH8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                r'$20',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: Sizes.p12,
                                    ),
                              ),
                              gapW4,
                              Text(
                                r'$10',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: primaryColor,
                                      fontSize: Sizes.p12,
                                    ),
                              ),
                            ],
                          ),
                          gapH8,
                          Text(
                            'This list is a wide range of Bangladeshi quisine',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          gapH16,
                          const PrimaryButton(),
                          gapH8,
                        ],
                      ),
                    ),
                  ),
                  gapW16,
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.p12, vertical: Sizes.p8),
                          decoration: BoxDecoration(
                              color: tertiaryColor,
                              borderRadius: BorderRadius.circular(Sizes.p8)),
                          child: Center(
                            child: Text(
                              'Requirement',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            gapW8,
                            const Expanded(
                              child: Text('Update soon'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            gapW8,
                            const Expanded(
                              child: Text('Update soon'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            gapW8,
                            const Expanded(
                              child: Text('Update soon'),
                            ),
                          ],
                        ),
                        Text(
                          'Not Like? Order now',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        gapH8,
                        const PrimaryButton(
                          title: 'Create Custom Package',
                          height: Sizes.p32,
                          width: double.infinity,
                        )
                      ],
                    ),
                  )),
                ],
              ),
              gapH20,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p12, vertical: Sizes.p8),
                decoration: BoxDecoration(
                    color: tertiaryColor,
                    borderRadius: BorderRadius.circular(Sizes.p8)),
                child: Column(
                  children: [
                    Text(
                      'Package Details',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    gapH8,
                    Text(
                        'Lorem ipsum is a placeholder text commonly used in the graphic, print, and publishing industries to preview layouts and visual mockups. It helps designers and publishers demonstrate how a document or typeface will look without using meaningful content.')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
