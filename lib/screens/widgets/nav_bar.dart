import 'package:flutter/material.dart';

import '../../constants/app_sizes.dart';
import '../../constants/constants.dart';
import 'photo.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final void Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: secondaryColor,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navItem(
            home,
            'Home',
            pageIndex == 0,
            onTap: () => onTap(0),
          ),
          navItem(
            order,
            'Order',
            pageIndex == 1,
            onTap: () => onTap(1),
          ),
          navItem(
            cart,
            'Cart',
            pageIndex == 2,
            onTap: () => onTap(2),
          ),
          navItem(
            favourite,
            'Favourite',
            pageIndex == 3,
            onTap: () => onTap(3),
          ),
          navItem(
            profile,
            'Profile',
            pageIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }

  Widget navItem(String icon, String name, bool selected,
      {void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p20, vertical: Sizes.p8),
        decoration: BoxDecoration(
          color: selected ? primaryColor : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.p12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: Sizes.p20,
                width: Sizes.p20,
                child:
                    Photo(icon, color: selected ? neutralColor : Colors.black)),
            gapH4,
            Text(name,
                style:
                    TextStyle(color: selected ? neutralColor : Colors.black)),
          ],
        ),
      ),
    );
  }
}
