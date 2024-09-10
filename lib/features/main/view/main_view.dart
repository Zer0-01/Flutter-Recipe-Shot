import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  static const String id = 'main_view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: const Text('Recipe Shot'),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedIndex: _currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
              ),
              selectedIcon: Icon(
                Icons.home_sharp,
                color: Color(0xFF68D2E8),
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.search_outlined,
              ),
              selectedIcon: Icon(
                Icons.search_sharp,
                color: Color(0xFF68D2E8),
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.notifications_outlined,
              ),
              selectedIcon: Icon(
                Icons.notifications_sharp,
                color: Color(0xFF68D2E8),
              ),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.email_outlined,
              ),
              selectedIcon: Icon(
                Icons.email_sharp,
                color: Color(0xFF68D2E8),
              ),
              label: 'Message',
            ),
          ],
        ),
        body: <Widget>[
          const Center(
            child: Text('Home'),
          ),
          const Center(
            child: Text('Search'),
          ),
          const Center(
            child: Text('Notifications'),
          ),
          const Center(
            child: Text('Message'),
          ),
        ][_currentPageIndex]);
  }
}
