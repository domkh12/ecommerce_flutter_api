import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:my_app_ecommerce/controller/dashboard_controller.dart';
import 'package:my_app_ecommerce/view/home/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder:  (controller) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tapIndex,
            children: [
              const HomeScreen(),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1
                  )
              )
          ),
          child: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: const EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            snakeViewColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showSelectedLabels: true,
            currentIndex: controller.tapIndex,
            onTap: (val){
              controller.updateIndex(val);
            },
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),

            ],
          ),
        ),
      ),

    );

  }
}

