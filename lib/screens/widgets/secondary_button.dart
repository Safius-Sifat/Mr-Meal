import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../constants/constants.dart';
import '../../utils/size_config.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(20),
      width: getProportionateScreenWidth(60),
      child: ElevatedButton(
        onPressed: () {},
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
