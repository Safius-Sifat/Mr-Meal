import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/app_sizes.dart';

class ShoppingCartItemShimmer extends StatelessWidget {
  const ShoppingCartItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 85,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Sizes.p8),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                  ),
                  Container(
                    width: 100,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
