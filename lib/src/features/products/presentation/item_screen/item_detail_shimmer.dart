import 'package:flutter/material.dart';

import '../../../../common_widgets/network_photo.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import 'tab_bar.dart';

class ItemDetailShimmer extends StatelessWidget {
  const ItemDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.p8),
                        child: const NetworkPhoto(
                            'https://via.placeholder.com/150'),
                      ),
                    ),
                    gapH8,
                    Text(
                      'Polao korma',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    gapH4,
                    const Text(';laksdjf;lkasjdflkasjdflkjasldk'),
                    Text(
                      'Date today 1:30 pm',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      children: [
                        Text(
                          '৳200',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                        ),
                        gapW8,
                        Text(
                          '500',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: primaryColor, size: 16),
                        Text(
                          '4.99',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: Sizes.p12,
                                  ),
                        ),
                        gapW4,
                        Text(
                          '15 Reviews',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: Sizes.p12,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              gapW12,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: tertiaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(Sizes.p8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Poalo korma\n',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                      TextSpan(
                          text:
                              'alksdjfjlkasjdflkjasdlfkjasldkfjlaskdjflksajdfl;kajsd;flkjasldkfjasl;kdjfl;kasdgshdfjasdlkfja;slkdfjl;kasdjflkasjdflkasjdflkashgjasdhfkljasdflkjasldkfaskldfkasjdfl;kasjdf;laksdjf',
                          style: Theme.of(context).textTheme.titleSmall),
                    ]),
                  ),
                ),
              )
            ],
          ),
          gapH16,
          const PrimaryButton(text: 'add to cart'),
          gapH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabButton(
                title: 'Item Description'.hardcoded,
                onTap: () {},
                isSelected: true,
              ),
              TabButton(
                title: 'Review & Feedback'.hardcoded,
                onTap: () {},
                isSelected: true,
              ),
              TabButton(
                title: 'Health Tips'.hardcoded,
                onTap: () {},
                isSelected: true,
              ),
            ],
          ),
          gapH16,
          // Expanded(
          //   child: TabBarView(
          //       physics: const NeverScrollableScrollPhysics(),
          //       controller: tabController,
          //       children: const [
          //         ItemDescription(),
          //         Text('delivery'),
          //         Text('reviews'),
          //       ]),
          // )
        ],
      ),
    );
  }
}
