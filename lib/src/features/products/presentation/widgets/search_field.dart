import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import 'photo.dart';

class SearchField extends StatelessWidget {
  SearchField({
    super.key,
  });

  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: textSecondaryColor,
              fontSize: Sizes.p16,
            ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Sizes.p12, vertical: Sizes.p8),
        prefix: const SizedBox(
          width: Sizes.p8,
        ),
        prefixIcon: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: Sizes.p8),
            Photo(search, height: Sizes.p16),
          ],
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: Sizes.p16,
          minHeight: Sizes.p16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.p8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        isCollapsed: true,
        fillColor: neutralColor,
      ),
    );
  }
}
