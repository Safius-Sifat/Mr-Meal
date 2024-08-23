import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../widgets/notification_widget.dart';
import '../widgets/photo.dart';
import 'item_description.dart';
import 'tab_bar.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

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
          child: const Text('Item Details'),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: Padding(
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
                      const Photo(pilaf),
                      gapH8,
                      Text(
                        'Plain White Rice',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      gapH4,
                      const Text('This list a whide range of products'),
                      Text(
                        'Date today 1:30 pm',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            r'$99.99',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                          ),
                          gapW4,
                          Text(
                            r'$20.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
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
                            text: 'Plain White Rice\n',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                )),
                        TextSpan(
                            text:
                                'This list a whide range of products.a;lsdflsakdflkasdjflksajdflksajdflksajdfl;ksadjfl;askjdfl;sakdjflk;asj',
                            style: Theme.of(context).textTheme.titleSmall),
                      ]),
                    ),
                  ),
                )
              ],
            ),
            gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TabButton(
                  title: 'Item Description'.hardcoded,
                  onTap: () {
                    tabController.animateTo(0);
                    setState(() {});
                  },
                  isSelected: tabController.index == 0,
                ),
                TabButton(
                  title: 'Review & Feedback'.hardcoded,
                  onTap: () {
                    tabController.animateTo(1);
                    setState(() {});
                  },
                  isSelected: tabController.index == 1,
                ),
                TabButton(
                  title: 'Health Tips'.hardcoded,
                  onTap: () {
                    tabController.animateTo(2);
                    setState(() {});
                  },
                  isSelected: tabController.index == 2,
                ),
              ],
            ),
            gapH16,
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const [
                    ItemDescription(),
                    Text('delivery'),
                    Text('reviews'),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
