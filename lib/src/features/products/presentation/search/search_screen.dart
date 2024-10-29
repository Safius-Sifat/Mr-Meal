import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../widgets/photo.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});

  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            right: Sizes.p12,
          ),
          child: TextFormField(
            focusNode: _focusNode,
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: textSecondaryColor,
                    fontSize: Sizes.p16,
                  ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p12, vertical: Sizes.p12),
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
              fillColor: tertiaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
