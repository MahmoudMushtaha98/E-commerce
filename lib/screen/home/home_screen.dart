import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;


  Widget setIcon(String path){
    return SvgPicture.asset(
        path,
        semanticsLabel: 'Acme Logo'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            icon: setIcon('assets/Shop Icon.svg'),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          const NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: 'School',
          ),
          const NavigationDestination(
            icon: Icon(Icons.add),
            label: 'School',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
      ][currentPageIndex],
    );
  }
}
