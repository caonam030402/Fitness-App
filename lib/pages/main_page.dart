import 'package:fitness_app/components/bottom_navigation_item.dart';
import 'package:fitness_app/configs/app_icons.dart';
import 'package:fitness_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar: MyBottomNavigation(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          }),
    );
  }

  final pages = <Widget>[
    const Center(child: Text('Home')),
    const Center(child: Text('Message')),
    const Center(child: Text('Add')),
    const Center(child: Text('Camera')),
    const Center(child: Text('Profile')),
  ];
}

enum Menus { home, message, search, photo, user }

class MyBottomNavigation extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;
  const MyBottomNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: [
          Positioned(
              right: 0,
              left: 0,
              top: 30,
              bottom: 0,
              child: Container(
                color: Colors.white,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      BottomNavigationItem(
                          onPressed: () => onTap(Menus.home),
                          index: currentIndex,
                          name: Menus.home,
                          iconActive: AppIcons.ic_home_fill,
                          icon: AppIcons.ic_home_stroke),
                      BottomNavigationItem(
                          onPressed: () => onTap(Menus.message),
                          index: currentIndex,
                          name: Menus.message,
                          iconActive: AppIcons.ic_message_fill,
                          icon: AppIcons.ic_message_stroke),
                      const Spacer(),
                      BottomNavigationItem(
                          onPressed: () => onTap(Menus.photo),
                          index: currentIndex,
                          name: Menus.photo,
                          iconActive: AppIcons.ic_camera_fill,
                          icon: AppIcons.ic_camera_stroke),
                      BottomNavigationItem(
                          onPressed: () => onTap(Menus.user),
                          index: currentIndex,
                          name: Menus.user,
                          iconActive: AppIcons.ic_user_fill,
                          icon: AppIcons.ic_user_stroke),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: 13,
              right: 0,
              left: 0,
              child: GestureDetector(
                onTap: () => onTap(Menus.search),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      gradient: AppColors.primaryGradiant,
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    AppIcons.ic_search_stroke,
                    color: AppColors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
