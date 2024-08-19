import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../constants/feaure_list.dart';
import '../../../constants/package_list.dart';
import '../../../utils/size_config.dart';
import 'food_grid.dart';
import 'widgets/feature_card.dart';
import 'widgets/notification_widget.dart';
import 'widgets/package_card.dart';
import 'widgets/photo.dart';
import 'widgets/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(height: 30, child: Photo(avatar)),
            gapW4,
            const Photo(location),
            gapW4,
            Text(
              'Dhaka, Bangladesh',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            gapW8,
            const Expanded(
              child: SearchField(),
            ),
          ],
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.p12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ]),
                child: Stack(
                  children: [
                    SizedBox(
                        height: SizeConfig.screenHeight * 0.2,
                        width: double.infinity,
                        child: const Photo(hero)),
                    Positioned(
                      left: Sizes.p8,
                      top: Sizes.p8,
                      child: Container(
                        padding: const EdgeInsets.all(Sizes.p16),
                        decoration: BoxDecoration(
                          color: neutralColor.withOpacity(0.6),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(Sizes.p8),
                          ),
                        ),
                        child: Text('Fast Order 20% discount',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: Sizes.p12,
                                )),
                      ),
                    ),
                  ],
                ),
              ),
              gapH12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Sizes.p12,
                    width: Sizes.p12,
                    decoration: const BoxDecoration(
                        color: primaryColor, shape: BoxShape.circle),
                  ),
                  gapW8,
                  Container(
                    height: Sizes.p12,
                    width: Sizes.p12,
                    decoration: const BoxDecoration(
                        color: secondaryColor, shape: BoxShape.circle),
                  ),
                  gapW8,
                  Container(
                    height: Sizes.p12,
                    width: Sizes.p12,
                    decoration: const BoxDecoration(
                        color: secondaryColor, shape: BoxShape.circle),
                  ),
                ],
              ),
              gapH12,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: SizeConfig.isMobile ? 260 : 300,
                    // padding: const EdgeInsets.all(Sizes.p8),
                    decoration: const BoxDecoration(
                        color: tertiaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(Sizes.p12)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            // spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    child: const FoodsGrid(),
                  ),
                  Positioned(
                    bottom: -Sizes.p16,
                    right:
                        SizeConfig.screenWidth / 2 - Sizes.p96 / 2 - Sizes.p16,
                    child: Container(
                      width: Sizes.p96,
                      padding: const EdgeInsets.all(Sizes.p4),
                      decoration: const BoxDecoration(
                          color: tertiaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(Sizes.p16)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              // spreadRadius: 1,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ]),
                      child: const Row(
                        children: [
                          Text(
                            'SEE MORE',
                          ),
                          gapW4,
                          Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              gapH24,
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: Sizes.p12,
                  runSpacing: Sizes.p12,
                  children: List.generate(
                    10,
                    (index) {
                      return FeatureCard(
                        title: kfeatures[index].title,
                        assetName: kfeatures[index].image,
                      );
                    },
                  ),
                ),
              ),
              gapH12,
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(Sizes.p8),
                  decoration: const BoxDecoration(
                      color: tertiaryColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(Sizes.p12)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          // spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: Row(
                    children: List.generate(4, (index) {
                      return PackageCard(
                        title: kPackages[index].name,
                        assetName: kPackages[index].image,
                        description: kPackages[index].description,
                        price: kPackages[index].price,
                        pastPrice: kPackages[index].pastPrice,
                      );
                    }),
                  )),
              gapH16,
            ],
          ),
        ),
      ),
    );
  }
}
