import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/breakpoints.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../routing/app_router.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
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
          child: Text('My Wallet'.hardcoded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          child: Column(
            children: [
              CustomCarouselSlider(
                value: ref.watch(fetchSlidersProvider(screen: 'Home Page')),
              ),
              gapH12,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.p12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.all(Sizes.p20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(Sizes.p24),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor.withOpacity(0.5)),
                          child: Center(
                            child: Text(
                              r'$230',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: neutralColor),
                            ),
                          ),
                        ),
                        gapH12,
                        PrimaryButton(
                          width: 90,
                          height: 40,
                          fontSize: 12,
                          onPressed: () =>
                              context.goNamed(AppRoute.inputAmount.name),
                          text: 'Recharge Now',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Have a coupon code'.hardcoded,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        gapH8,
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.done,
                            autocorrect: false,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                              hintText: 'Promo Code here',
                              isCollapsed: true,
                              contentPadding: const EdgeInsets.all(Sizes.p8),
                              hintStyle: const TextStyle(
                                color: textFieldHint,
                                fontSize: Sizes.p8,
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: secondaryColor),
                                borderRadius: BorderRadius.circular(Sizes.p8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: secondaryColor),
                                borderRadius: BorderRadius.circular(Sizes.p8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: secondaryColor),
                                borderRadius: BorderRadius.circular(Sizes.p8),
                              ),
                              filled: true,
                              fillColor: textFieldColor,
                            ),
                          ),
                        ),
                        gapH12,
                        PrimaryButton(
                          width: 90,
                          height: 40,
                          fontSize: 12,
                          onPressed: () {},
                          text: 'Apply Code',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              gapH20,
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < Breakpoint.tablet;
                  if (isMobile) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.p12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      padding: const EdgeInsets.all(Sizes.p20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              PrimaryButton(
                                width: 90,
                                height: 40,
                                fontSize: 12,
                                onPressed: () {},
                                text: 'Take loan'.hardcoded,
                              ),
                              gapW12,
                              Text('You will get 300 Tk quick loan'.hardcoded)
                            ],
                          ),
                          gapH20,
                          Row(
                            children: [
                              Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: true,
                                  onChanged: (value) {}),
                              Expanded(
                                child: Text(
                                  'By clicking this box, you certify that you agree to our Loan Policy & Condition'
                                      .hardcoded,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: true,
                                  onChanged: (value) {}),
                              Expanded(
                                child: Text(
                                  'Complete verification'.hardcoded,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                          Text(
                            'Requirement',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          gapH4,
                          const Text('# hello hello'),
                          const Text('# hello hello'),
                          const Text('# hello hello'),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.p12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      padding: const EdgeInsets.all(Sizes.p20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    PrimaryButton(
                                      width: 90,
                                      height: 40,
                                      fontSize: 12,
                                      onPressed: () {},
                                      text: 'Take loan'.hardcoded,
                                    ),
                                    gapW12,
                                    Text('You will get 300 Tk quick loan'
                                        .hardcoded)
                                  ],
                                ),
                                gapH20,
                                Row(
                                  children: [
                                    Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: true,
                                        onChanged: (value) {}),
                                    Expanded(
                                      child: Text(
                                        'By clicking this box, you certify that you agree to our Loan Policy & Condition'
                                            .hardcoded,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: true,
                                        onChanged: (value) {}),
                                    Expanded(
                                      child: Text(
                                        'Complete verification'.hardcoded,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 2,
                            child: Container(
                              width: 1,
                              height: 120,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: Sizes.p16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Requirement',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  gapH4,
                                  const Text('# hello hello'),
                                  const Text('# hello hello'),
                                  const Text('# hello hello'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
              gapH12,
            ],
          ),
        ),
      ),
    );
  }
}
