import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../routing/app_router.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import '../../wallet/data/wallet_repository.dart';

class MyReportScreen extends ConsumerWidget {
  const MyReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(fetchBalanceProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('My Report'.hardcoded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          child: Column(
            children: [
              CustomCarouselSlider(
                value: ref.watch(fetchSlidersProvider(screen: myReportParam)),
              ),
              gapH12,
              Row(
                // alignment: WrapAlignment.center,
                children: [
                  Expanded(
                    child: ReportInfoWidget(
                      title: 'Total Meal'.hardcoded,
                      value: '19',
                    ),
                  ),
                  balance.when(
                    data: (bal) => Expanded(
                      child: ReportInfoWidget(
                        title: 'Total Balance'.hardcoded,
                        value: bal.balance.toString(),
                      ),
                    ),
                    loading: () => Skeletonizer(
                      child: Expanded(
                        child: ReportInfoWidget(
                          title: 'Total Balance'.hardcoded,
                          value: '1000',
                        ),
                      ),
                    ),
                    error: (e, st) => Expanded(
                      child: ReportInfoWidget(
                        title: 'Total Balance'.hardcoded,
                        value: '-1',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReportInfoWidget(
                      title: 'Pending Complain'.hardcoded,
                      value: '0',
                    ),
                  ),
                ],
              ),
              gapH64,
              Row(
                children: [
                  Expanded(
                      child: PrimaryButton(
                          text: 'View Meal History'.hardcoded,
                          fontSize: 10,
                          onPressed: () {
                            context.goNamed(AppRoute.mealHistory.name);
                          })),
                  gapW8,
                  Expanded(
                      child: PrimaryButton(
                          text: 'View Recharge History'.hardcoded,
                          fontSize: 10,
                          onPressed: () {
                            context.goNamed(AppRoute.rechargeHistory.name);
                          })),
                  gapW8,
                  Expanded(
                      child: PrimaryButton(
                          text: 'View Complain History'.hardcoded,
                          fontSize: 10,
                          onPressed: () {})),
                ],
              ),
              gapH64,
              Row(
                children: [
                  Expanded(
                      child: PrimaryButton(
                          text: 'Download Meal History'.hardcoded,
                          fontSize: 12,
                          onPressed: () {})),
                  gapW8,
                  Expanded(
                      child: PrimaryButton(
                          text: 'Download Balance History'.hardcoded,
                          fontSize: 12,
                          onPressed: () {})),
                ],
              ),
              gapH16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('N.B.'.hardcoded,
                      style: Theme.of(context).textTheme.titleLarge),
                  gapH8,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('• '),
                      Expanded(
                        child: Text(
                            'You can only order 3 meals per day'.hardcoded),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('• '),
                      Expanded(
                        child: Text('You have to recharge before'.hardcoded),
                      ),
                    ],
                  ),
                ],
              ),
              gapH12,
            ],
          ),
        ),
      ),
    );
  }
}

class ReportInfoWidget extends StatelessWidget {
  const ReportInfoWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(Sizes.p24),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: primaryColor.withOpacity(0.5)),
          child: Center(
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: neutralColor),
            ),
          ),
        ),
        gapH8,
        Container(
          height: Sizes.p40,
          constraints: const BoxConstraints(
            maxWidth: 120,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: Sizes.p8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: tertiaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(Sizes.p12),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: Sizes.p12),
            ),
          ),
        ),
      ],
    );
  }
}
