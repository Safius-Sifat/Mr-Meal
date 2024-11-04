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
import '../../../utils/size_config.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import '../../wallet/data/wallet_repository.dart';

class MyReportScreen extends ConsumerWidget {
  const MyReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(fetchBalanceProvider);
    SizeConfig().init(context);
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReportInfoWidget(
                    title: 'Total Meal'.hardcoded,
                    value: '0',
                  ),
                  balance.when(
                    data: (bal) => ReportInfoWidget(
                      title: 'Total Balance'.hardcoded,
                      value: '৳${bal.balance}',
                    ),
                    loading: () => Skeletonizer(
                      child: ReportInfoWidget(
                        title: 'Total Balance'.hardcoded,
                        value: '1000',
                      ),
                    ),
                    error: (e, st) => ReportInfoWidget(
                      title: 'Total Balance'.hardcoded,
                      value: '0',
                    ),
                  ),
                  ReportInfoWidget(
                    title: 'Pending Complain'.hardcoded,
                    value: '0',
                  ),
                ],
              ),
              gapH64,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                      width: SizeConfig.screenWidth / 3.5,
                      text: 'View Meal History'.hardcoded,
                      fontSize: 10,
                      onPressed: () {
                        context.goNamed(AppRoute.mealHistory.name);
                      }),
                  gapW8,
                  PrimaryButton(
                      width: SizeConfig.screenWidth / 3.5,
                      text: 'View Recharge History'.hardcoded,
                      fontSize: 10,
                      onPressed: () {
                        context.goNamed(AppRoute.rechargeHistory.name);
                      }),
                  gapW8,
                  PrimaryButton(
                      width: SizeConfig.screenWidth / 3.5,
                      text: 'View Complain History'.hardcoded,
                      fontSize: 10,
                      onPressed: () {}),
                ],
              ),
              gapH64,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                      width: SizeConfig.screenWidth / 2.3,
                      text: 'Download Meal History'.hardcoded,
                      fontSize: 12,
                      onPressed: () {}),
                  gapW8,
                  PrimaryButton(
                      width: SizeConfig.screenWidth / 2.3,
                      text: 'Download Balance History'.hardcoded,
                      fontSize: 12,
                      onPressed: () {}),
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
          height: SizeConfig.isMobile ? Sizes.p64 : Sizes.p80,
          width: SizeConfig.isMobile ? Sizes.p64 : Sizes.p80,
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
          constraints: BoxConstraints(
            maxWidth: SizeConfig.screenWidth / 3.8,
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
