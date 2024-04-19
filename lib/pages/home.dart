import 'package:counter_app/pages/all%20dhikr%20info%20page/all_dhikr_info_page.dart';
import 'package:counter_app/pages/counter%20page/counter_page.dart';
import 'package:counter_app/pages/goals%20page/goals_page.dart';
import 'package:counter_app/pages/more%20page/more_page.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int navBarIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      navBarIndex = index;
    });
  }

  Widget buildBody(int index) {
    switch (index) {
      case 0:
        return const CounterPage();
      case 1:
        return const GoalsPage();
      case 2:
        return const AllDhikrInfoPage();
      case 3:
        return const MorePage();
      default:
        return const Scaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(navBarIndex),
      bottomNavigationBar: Container(
        color: C.bgColor(ref),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: R.sw(15, context),
            vertical: R.sh(16, context),
          ),
          child: GNav(
            haptic: true,
            onTabChange: onTabTapped,
            gap: 8,
            tabBackgroundColor: C.buttonColor(ref),
            activeColor: Colors.black,
            color: C.textColor(ref),
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.format_list_bulleted_add,
                text: 'Goals',
              ),
              GButton(
                icon: Icons.menu_book_rounded,
                text: 'Dhikrs',
              ),
              GButton(
                icon: Icons.menu_outlined,
                text: 'More',
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: navBarIndex,
      //   onTap: onTabTapped,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.grey,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home_filled,
      //       ),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.format_list_bulleted_add,
      //       ),
      //       label: "Goals",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.menu_book_rounded,
      //       ),
      //       label: "Dhikrs",
      //     ),
      //   ],
      //   elevation: 5,
      // ),
    );
  }
}
