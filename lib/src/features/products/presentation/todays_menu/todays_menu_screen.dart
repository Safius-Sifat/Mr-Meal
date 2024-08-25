import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/size_config.dart';
import '../widgets/notification_widget.dart';
import '../widgets/photo.dart';
import 'todays_menu_grid.dart';

class TodaysMenuScreen extends StatelessWidget {
  const TodaysMenuScreen({super.key});

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
          child: const Text("Our Today's Menu"),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p12),
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
              gapH16,
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
              gapH24,
              const TodaysMenuGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuContainer extends StatelessWidget {
  const MenuContainer({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p12, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.circular(Sizes.p8)),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p12, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.circular(Sizes.p32)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p12, vertical: Sizes.p8),
                margin: const EdgeInsets.all(Sizes.p8),
                decoration: BoxDecoration(
                    color: neutralColor,
                    borderRadius: BorderRadius.circular(Sizes.p16)),
                child: Center(
                  child: Text(
                    'Breakfast Item List',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p12, vertical: Sizes.p8),
                margin: const EdgeInsets.all(Sizes.p8),
                decoration: BoxDecoration(
                    color: neutralColor,
                    borderRadius: BorderRadius.circular(Sizes.p16)),
                child: Center(
                  child: Text(
                    'Lunch Item List',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p12, vertical: Sizes.p8),
                margin: const EdgeInsets.all(Sizes.p8),
                decoration: BoxDecoration(
                    color: neutralColor,
                    borderRadius: BorderRadius.circular(Sizes.p16)),
                child: Center(
                  child: Text(
                    'Dinner Item List',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
