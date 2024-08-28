import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';

class VerificationTextfield extends StatelessWidget {
  final TextEditingController controller;
  const VerificationTextfield(
      {super.key, required this.onChanged, required this.controller});

  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: 64,
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: secondaryColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(Sizes.p12)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(Sizes.p12),
          ),
        ),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
