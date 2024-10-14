import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../constants/app_sizes.dart';
import '../../domain/item_detail.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({super.key, required this.detail});
  final ItemDetail detail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(detail.itemName, style: Theme.of(context).textTheme.titleLarge),
          gapH16,
          HtmlWidget(detail.longDescription, customStylesBuilder: (element) {
            return {'text-align': 'justify'};
          }),
        ],
      ),
    );
  }
}
