import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../domain/category.dart';
import '../widgets/photo.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: Sizes.p12, vertical: Sizes.p8),
      decoration: BoxDecoration(
          color: tertiaryColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Photo(category.image),
          gapW8,
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
