import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';

class PackageButton extends StatelessWidget {
  const PackageButton(
      {super.key,
      this.title = 'Add to Cart',
      this.height = Sizes.p24,
      required this.onPressed,
      this.width = 60,
      this.isLoading = false});

  final double height;
  final double width;
  final bool isLoading;
  final void Function() onPressed;

  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
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
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(2),
                child: FittedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: neutralColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.p12),
              ),
      ),
    );
  }
}
