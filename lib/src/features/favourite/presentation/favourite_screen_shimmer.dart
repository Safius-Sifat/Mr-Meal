import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widgets/network_photo.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';

class FavouriteScreenShimmer extends StatelessWidget {
  const FavouriteScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
            child: Container(
              padding: const EdgeInsets.all(Sizes.p8),
              height: Sizes.p96,
              decoration: BoxDecoration(
                color: tertiaryColor,
                border: Border.all(color: secondaryColor),
                borderRadius: BorderRadius.circular(Sizes.p12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.p8),
                        child: const NetworkPhoto(
                            'https://via.placeholder.com/150')),
                  ),
                  gapW8,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Polao korma',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 14,
                                )),
                        gapH4,
                        // const Text('This is wide range of'),
                        // const Text(
                        //   'Date: Today 1:30 pm',
                        // ),
                        Row(
                          children: [
                            Text(
                              '৳${200}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.p12,
                                  ),
                            ),
                            gapW8,
                            Text(
                              '৳500',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.p12,
                                  ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     const Icon(Icons.star, color: primaryColor, size: 16),
                        //     Text(
                        //       '4.99',
                        //       style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        //             fontSize: Sizes.p8,
                        //           ),
                        //     ),
                        //     gapW4,
                        //     Text(
                        //       '15 Reviews',
                        //       style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        //             fontSize: Sizes.p8,
                        //           ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
