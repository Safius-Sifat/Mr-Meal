import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/size_config.dart';
import '../food_grid.dart';
import '../widgets/notification_widget.dart';
import '../widgets/photo.dart';
import 'category_grid.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
          child: const Text('Our All Category'),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
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
              const CategoryGrid(),
              gapH32,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p12, vertical: Sizes.p8),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Lunch Time',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p12, vertical: Sizes.p8),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Order between 9:00 AM - 12:00 PM',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  gapH8,
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
                ],
              ),
              gapH32,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p12, vertical: Sizes.p8),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Special Item',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p12, vertical: Sizes.p8),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Order between 9:00 AM - 12:00 PM',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  gapH8,
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
                ],
              ),
              gapH16,
            ],
          ),
        ),
      ),
    );
  }
}
