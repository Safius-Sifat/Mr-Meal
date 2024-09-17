import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../routing/app_router.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 60,
      child: ElevatedButton(
        onPressed: () {
          context.goNamed(AppRoute.packageDetail.name,
              pathParameters: {'id': '$id'});
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(secondaryColor),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          ),
          elevation: WidgetStateProperty.all<double>(0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
          ),
        ),
        child: Text(
          'Details',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w400, fontSize: Sizes.p8),
        ),
      ),
    );
  }
}
