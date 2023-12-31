import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:my_grocery/controller/dashboard_controller.dart';
import 'package:my_grocery/theme/app_theme.dart';
import 'package:my_grocery/view/account/account_screen.dart';
import 'package:my_grocery/view/category/category_screen.dart';
import 'package:my_grocery/view/home/home_screen.dart';
import 'package:my_grocery/view/product/product_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (controller) => SafeArea(
          child: Scaffold(
                backgroundColor: AppTheme.lightBackgroundColor,
                body: SafeArea(
                  child: IndexedStack(
                    index: controller.tabIndex,
                    children: const [
                      HomeScreen(),
                      ProductScreen(),
                      CategoryScreen(),
                      AccountScreen(),
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.lightBackgroundColor,
                      border: Border(
                          top: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 0.7))),
                  child: SnakeNavigationBar.color(
                    backgroundColor: AppTheme.lightBackgroundColor,
                    behaviour: SnakeBarBehaviour.floating,
                    snakeShape: SnakeShape.circle,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    unselectedLabelStyle: const TextStyle(fontSize: 11),
                    snakeViewColor: Theme.of(context).primaryColor,
                    unselectedItemColor: Theme.of(context).colorScheme.secondary,
                    showUnselectedLabels: true,
                    currentIndex: controller.tabIndex,
                    onTap: (val) {
                      controller.updateIndex(val);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.category), label: 'Product'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.menu), label: 'Category'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle), label: 'Account')
                    ],
                  ),
                ),
              ),
        ));
  }
}
