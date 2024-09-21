import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';
import '../constants/constants.dart';

/// Primary button based on [ElevatedButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.height = Sizes.p48,
    this.width = double.infinity,
    this.fontSize = Sizes.p16,
  });
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p16,
          ),
        ),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: neutralColor, fontSize: fontSize),
              ),
      ),
    );
  }
}
