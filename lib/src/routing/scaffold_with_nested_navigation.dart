// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_sizes.dart';
import '../constants/constants.dart';
import '../features/cart/application/cart_service.dart' hide cart;
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

class NavBar extends ConsumerWidget {
  final int pageIndex;
  final void Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCount = ref.watch(cartItemsCountProvider);
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p4),
      color: secondaryColor,
      // elevation: 0,
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
                false,
                onTap: () => onTap(0),
              ),
            ),
            Expanded(
              child: navItem(
                announcement,
                'Announce',
                pageIndex == 1,
                false,
                onTap: () => onTap(1),
              ),
            ),
            Expanded(
              child: navItem(
                cart,
                'Cart',
                pageIndex == 2,
                cartCount > 0,
                onTap: () => onTap(2),
                count: cartCount,
              ),
            ),
            Expanded(
              child: navItem(
                favourite,
                'Favourite',
                pageIndex == 3,
                false,
                onTap: () => onTap(3),
              ),
            ),
            Expanded(
              child: navItem(
                profile,
                'Profile',
                pageIndex == 4,
                false,
                onTap: () => onTap(4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(String icon, String name, bool selected, bool isBadgeVisible,
      {void Function()? onTap, int count = 0}) {
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
              Badge.count(
                offset: const Offset(10, -10),
                count: count,
                backgroundColor: selected ? neutralColor : null,
                textColor: selected ? primaryColor : null,
                isLabelVisible: isBadgeVisible,
                child: SizedBox(
                  height: Sizes.p24,
                  width: Sizes.p24,
                  child: selected
                      ? DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.white,
                            width: 2,
                          )),
                          child: Photo(icon))
                      : Photo(icon),
                ),
              ),
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
