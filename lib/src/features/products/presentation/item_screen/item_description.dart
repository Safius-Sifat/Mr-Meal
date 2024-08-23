import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Text('Item Description'),
          Text('This list a whide range of products'),
        ],
      ),
    );
  }
}
