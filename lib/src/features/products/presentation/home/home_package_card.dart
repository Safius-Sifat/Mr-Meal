import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/network_photo.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../cart/domain/online_cart.dart';
import '../../../cart/presentation/add_to_cart/add_to_cart_controller.dart';
import '../../domain/packages.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

class HomePackageCard extends ConsumerStatefulWidget {
  const HomePackageCard({
    super.key,
    required this.data,
  });

  final Datum data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomePackageCardState();
}

class _HomePackageCardState extends ConsumerState<HomePackageCard> {
  Datum get data => widget.data;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<dynamic>>(
      addToCartControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(addToCartControllerProvider);
    return Container(
      width: 110,
      padding: const EdgeInsets.all(Sizes.p4),
      decoration: BoxDecoration(
        color: neutralColor,
        border: Border.all(color: tertiaryColor),
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  context.goNamed(AppRoute.packageDetail.name,
                      pathParameters: {'id': '${data.id}'});
                },
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    child: NetworkPhoto(data.image),
                  ),
                ),
              ),
              Positioned(
                top: Sizes.p4,
                right: Sizes.p4,
                child: Container(
                  padding: const EdgeInsets.all(Sizes.p4),
                  decoration: const BoxDecoration(
                    color: tertiaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.p4)),
                  ),
                  child: const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                    size: Sizes.p12,
                  ),
                ),
              ),
            ],
          ),
          gapH8,
          InkWell(
            onTap: () {
              context.goNamed(AppRoute.packageDetail.name,
                  pathParameters: {'id': '${data.id}'});
            },
            child: Text(
              data.packageName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          gapH4,
          HtmlWidget(
            data.shortDescription,
            customStylesBuilder: (element) {
              return {'text-align': 'center'};
            },
          ),

          gapH8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '৳${NumberFormat('', 'bn').format(data.discountPrice)}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      fontSize: Sizes.p12,
                    ),
              ),
              gapW4,
              Text(
                '৳${NumberFormat('', 'bn').format(data.packagePrice)}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: primaryColor,
                      fontSize: Sizes.p12,
                    ),
              ),
            ],
          ),
          gapH8,
          SecondaryButton(id: data.id),
          gapH8,
          PackageButton(
            isLoading: isLoading,
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              await ref
                  .read(addToCartControllerProvider.notifier)
                  .addItem(CartModel.empty().copyWith(
                    packageId: data.id,
                    packageName: data.packageName,
                    packagePrice: data.packagePrice,
                    packageDiscountPrice: data.discountPrice,
                    packageImage: data.image,
                  ));
              setState(() {
                isLoading = false;
              });
            },
          ),
          // PackageButton(
          //   isLoading: isLoading,
          //   onPressed: onAddToCart,
          // ),
          // PackageButton(
          //   isLoading: state.isLoading,
          //   onPressed: () async {
          //     await ref
          //         .read(addToCartControllerProvider.notifier)
          //         .addItem(CartModel.empty().copyWith(
          //           packageId: data.id,
          //           packageName: data.packageName,
          //           packagePrice: data.packagePrice,
          //           packageDiscountPrice: data.discountPrice,
          //           packageImage: data.image,
          //         ));
          //   },
          // ),
          gapH8,
        ],
      ),
    );
  }
}
