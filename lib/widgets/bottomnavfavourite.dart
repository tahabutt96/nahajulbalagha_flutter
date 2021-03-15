import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/screens/favouriteArabic.dart';
import 'package:nahjul_balagha/screens/favouriteFarsi.dart';
import 'package:nahjul_balagha/screens/favouriteUrdu.dart';

class FavBottomNav extends StatefulWidget {
  @override
  _FavBottomNavState createState() => _FavBottomNavState();
}

class _FavBottomNavState extends State<FavBottomNav> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      favArabic(),
      favUrdu(),
      favFarsi(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary_background,
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text("Favourite",style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600
          ),),
        ),
        centerTitle: true,
      ),
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primary_background,
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        // showElevation: true,
        // itemCornerRadius: 8,
        // curve: Curves.easeInBack,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_sharp),
            title: Text('Maktoob',style: TextStyle(fontFamily: 'Lato-Bold',fontWeight: FontWeight.bold)),
            // activeColor: Colors.white,
            // textAlign: TextAlign.center,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_sharp),
            title: Text('Hikmat',style: TextStyle(fontFamily: 'Lato-Bold',fontWeight: FontWeight.bold)),
            // activeColor: Colors.white,
            // textAlign: TextAlign.center,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_sharp),
            title: Text('Khutba',style: TextStyle(fontFamily: 'Lato-Bold',fontWeight: FontWeight.bold)),
            // activeColor: Colors.white,
            // textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
