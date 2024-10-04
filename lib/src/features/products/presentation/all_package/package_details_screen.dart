import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../common_widgets/network_photo.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../data/item_repository.dart';
import '../../data/package_repository.dart';
import '../home/carousel_slider.dart';
import '../widgets/notification_widget.dart';
import '../widgets/primary_button.dart';

class PackageDetailScreen extends ConsumerWidget {
  const PackageDetailScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageDetail = ref.watch(getPackageDetailProvider(id: id));
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
        actions: const [
          NotificationWidget(),
          gapW16,
        ],
      ),
      body: AsyncValueWidget(
          value: packageDetail,
          data: (detail) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
                child: Column(
                  children: [
                    CustomCarouselSlider(
                      value:
                          ref.watch(fetchSlidersProvider(screen: 'Home Page')),
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
                                      horizontal: Sizes.p12,
                                      vertical: Sizes.p8),
                                  decoration: BoxDecoration(
                                      color: tertiaryColor,
                                      borderRadius:
                                          BorderRadius.circular(Sizes.p24)),
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
                                AspectRatio(
                                  aspectRatio: 1.5,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.p8),
                                    child: NetworkPhoto(detail.image),
                                  ),
                                ),
                                gapH8,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '৳${detail.discountPrice}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: Sizes.p12,
                                          ),
                                    ),
                                    gapW4,
                                    Text(
                                      '৳${detail.packagePrice}',
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
                                  detail.shortDescription,
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
                                    borderRadius:
                                        BorderRadius.circular(Sizes.p8)),
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
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          gapH8,
                          Text(detail.longDescription)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
