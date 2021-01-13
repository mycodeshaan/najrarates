import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naijaratesapp/controllers/nav_controller.dart';
import 'package:naijaratesapp/views/bitcoin_screen.dart';
import 'package:naijaratesapp/views/currency_screen.dart';
import 'package:naijaratesapp/views/gold_screen.dart';
import 'package:naijaratesapp/views/home_screen.dart';
import 'package:naijaratesapp/views/news_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavScreen extends StatelessWidget {
  final navController = Get.put(NavController());
  final List<Widget> _screens = [
    HomeScreen(),
    GoldScreen(),
    CurrencyScreen(),
    BitcoinScreen(),
    NewsScreen(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.search,
    Icons.notifications_rounded,
    Icons.chat,
    Icons.menu_outlined
  ];
  @override
  Widget build(BuildContext context) {
    print(navController.selectedIndex.value);
    return DefaultTabController(
      length: _icons.length,
      child: Obx(() => Scaffold(
            // appBar: AppBar(),
            body: IndexedStack(
              index: navController.selectedIndex.value,
              children: _screens,
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: navController.selectedIndex.value,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) => navController.changeIndex(index),

              items: [
                BottomNavyBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  title: Text('Home'),
                  activeColor: Colors.blue,
                ),
                BottomNavyBarItem(
                    icon: FaIcon(FontAwesomeIcons.moneyCheck),
                    title: Text('Gold'),
                    activeColor: Colors.orange),
                BottomNavyBarItem(
                    icon: FaIcon(FontAwesomeIcons.dollarSign),
                    title: Text('Currency'),
                    activeColor: Colors.green),
                BottomNavyBarItem(
                    icon: FaIcon(FontAwesomeIcons.bitcoin),
                    title: Text('Bitcoin'),
                    activeColor: Colors.indigo),
                BottomNavyBarItem(
                    icon: FaIcon(FontAwesomeIcons.newspaper),
                    title: Text('News'),
                    activeColor: Colors.purple),
              ],
            ),
          )),
    );
  }
}
