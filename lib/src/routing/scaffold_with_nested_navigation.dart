// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_sizes.dart';
import '../constants/constants.dart';
import '../features/products/presentation/widgets/photo.dart';

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar:
            NavBar(pageIndex: navigationShell.currentIndex, onTap: _goBranch));
  }
}

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
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: navItem(
                home,
                'Home',
                pageIndex == 0,
                onTap: () => onTap(0),
              ),
            ),
            Expanded(
              child: navItem(
                order,
                'Order',
                pageIndex == 1,
                onTap: () => onTap(1),
              ),
            ),
            Expanded(
              child: navItem(
                cart,
                'Cart',
                pageIndex == 2,
                onTap: () => onTap(2),
              ),
            ),
            Expanded(
              child: navItem(
                favourite,
                'Favourite',
                pageIndex == 3,
                onTap: () => onTap(3),
              ),
            ),
            Expanded(
              child: navItem(
                profile,
                'Profile',
                pageIndex == 4,
                onTap: () => onTap(4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(String icon, String name, bool selected,
      {void Function()? onTap}) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 250),
      offset: selected ? const Offset(0, -0.25) : Offset.zero,
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.p12),
        ),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: Sizes.p4),
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
                  child: Photo(icon,
                      color: selected ? neutralColor : Colors.black)),
              gapH4,
              Text(name,
                  style:
                      TextStyle(color: selected ? neutralColor : Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
