import 'package:evgo/screen/home/profile_screen.dart';
import 'package:evgo/screen/home/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'favorite_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const screenRoute = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            icon: setIcon('assets/icons/Shop Icon.svg'),
            label: '',
          ),
           NavigationDestination(
            icon: setIcon('assets/icons/Heart Icon.svg'),
            label: '',
          ),
           NavigationDestination(
            icon: setIcon('assets/icons/Chat bubble Icon.svg'),
            label: '',
          ),
           NavigationDestination(
            icon: setIcon('assets/icons/User.svg'),
            label: '',
          ),
        ],
      ),
      body: [
         const ShopScreen(),
        const FavoriteScreen(),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        const ProfileScreen(),
      ][currentPageIndex],
    );
  }
}

Widget setIcon(String path){
  return SvgPicture.asset(
      path,
      semanticsLabel: 'Acme Logo'
  );
}


double widthOrHeight(BuildContext context,{required int choice}){
  if(choice!=0) {
    return MediaQuery.of(context).size.width;
  }else {
    return MediaQuery.of(context).size.height;
  }
}