import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/screens/favouriteArabic.dart';
import 'package:nahjul_balagha/screens/favouriteFarsi.dart';
import 'package:nahjul_balagha/screens/favouriteUrdu.dart';
import 'package:nahjul_balagha/screens/hikmatlist.dart';
import 'package:nahjul_balagha/screens/khutbalist.dart';
import 'package:nahjul_balagha/screens/maktooblist.dart';

class homebottomnav extends StatefulWidget {
  @override
  _homebottomnavState createState() => _homebottomnavState();
}

class _homebottomnavState extends State<homebottomnav> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      maktooblist(),
      hikmatlist(),
      khutbalist(),
    ];
    return Scaffold(
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
