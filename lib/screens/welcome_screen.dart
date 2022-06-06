import 'package:flutter/material.dart';
import 'package:sharpnews/app/constants/colors.dart';
import 'package:sharpnews/screens/latest_news_screen.dart';
import 'package:sharpnews/screens/screens.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static String id = 'Home_Screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LatestNewsScreen(),
  ];
  void _onItemTapped(int index) {
    if (index == 2 || index == 3) {
      setState(() {
        _selectedIndex = 0;
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 24, left: 24),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BottomNavigationBar(
                  unselectedItemColor: const Color(0xffFFFFFF),
                  backgroundColor: appbusyColor,
                  currentIndex: _selectedIndex,
                  selectedItemColor: appBackgroundColor,
                  onTap: _onItemTapped,
                  type: BottomNavigationBarType.fixed,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/app_icons/home.png'),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/app_icons/trending_up.png'),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/app_icons/search_two.png'),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/app_icons/bookmark.png'),
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
