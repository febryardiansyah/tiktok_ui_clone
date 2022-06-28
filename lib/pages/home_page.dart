import 'package:flutter/material.dart';
import 'package:tiktok_clone/pages/main_home.dart';
import 'package:tiktok_clone/utils/colors.dart';
import 'package:tiktok_clone/utils/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainHome(),
      backgroundColor: appBgColor,
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight + 24,
        padding: EdgeInsets.only(
          bottom: 8,left: 16,right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: bottomNavItems.map((e){
            if (!e.isIcon) {
              return CenterBottomNav();
            }
            return Column(
              children: [
                Icon(e.icon,color: white),
                SizedBox(height: 8,),
                Text(e.label,style: TextStyle(color: white),),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  int selectedIndex = 0;
  List<Widget> children = [
    MainHome(),
    Text('Home'),
    Text('Home'),
    Text('Home'),
    Text('Home'),
  ];
  List<_BottomNavModel> bottomNavItems = [
    _BottomNavModel(icon: TikTokIcons.home, label: 'Home', isIcon: true),
    _BottomNavModel(icon: TikTokIcons.search, label: 'Discover', isIcon: true),
    _BottomNavModel(icon: TikTokIcons.home, label: '', isIcon: false),
    _BottomNavModel(icon: TikTokIcons.messages, label: 'Inbox', isIcon: true),
    _BottomNavModel(icon: TikTokIcons.profile, label: 'Me', isIcon: true),
  ];
}

class _BottomNavModel {
  final IconData icon;
  final String label;
  final bool isIcon;

  _BottomNavModel({
    required this.icon,
    required this.label,
    required this.isIcon,
  });
}

class CenterBottomNav extends StatelessWidget {
  const CenterBottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 35,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            right: 5,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
