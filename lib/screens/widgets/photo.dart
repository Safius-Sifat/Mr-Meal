import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_sizes.dart';

class Photo extends StatelessWidget {
  const Photo(this.assetName, {super.key, this.color = Colors.black});

  final String assetName;

  final Color color;
  @override
  Widget build(BuildContext context) {
    if (assetName.split('.').last == 'png') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.p8),
        child: Image.asset(
          assetName,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return SvgPicture.asset(
        assetName,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }
  }
}
