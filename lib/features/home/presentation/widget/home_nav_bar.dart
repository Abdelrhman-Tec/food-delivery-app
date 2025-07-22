import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:food_app/features/favorites/presentation/screens/favorite_screen.dart';
import 'package:food_app/features/home/presentation/screens/home_screen.dart';
import 'package:food_app/features/notifications/presentation/screens/notfictions_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      CartScreen(),
      FavoriteScreen(),
      NotfictionsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: "Home",
        activeColorPrimary: AppColors.lightTypography500,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        title: "Cart",
        activeColorPrimary: AppColors.lightTypography500,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_outline),
        title: "Saved",
        activeColorPrimary: AppColors.lightTypography500,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_active_outlined),
        title: "Notification",
        activeColorPrimary: AppColors.lightTypography500,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      navBarHeight: 60,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: const NavBarDecoration(
        border: Border(top: BorderSide(color: Colors.black, width: 0.5)),
      ),
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style11,
    );
  }
}
