import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';
import '../utilities/global_variables.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _page = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Themes.whiteColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: _page == 0 ? Colors.orange : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.transform,
              color: _page == 1 ? Colors.orange : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              color: _page == 2 ? Colors.orange : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _page == 3 ? Colors.orange : Colors.grey,
            ),
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
