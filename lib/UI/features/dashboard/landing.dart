import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/UI/features/dashboard/tabs/home.dart';
import 'package:prestmit/constants/image_path.dart';

class LandingTab extends StatefulWidget {
  const LandingTab({super.key});
  static const routeName = "/landing";

  @override
  State<LandingTab> createState() => _LandingTabState();
}

class _LandingTabState extends State<LandingTab> {
  int selectedIndex = 0;

  List<Widget> tabList = [
    Home()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBar(icon: ImagePath.home),
          _buildBar(icon: ImagePath.receipt),
          _buildBar(icon: ImagePath.send),
          _buildBar(icon: ImagePath.settings),
        ],
      ),
    );
  }

  _buildBar({required String icon}){
    return BottomNavigationBarItem(
      label: '',
      icon: SvgPicture.asset(icon),
    );
  }
}
