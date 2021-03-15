import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/models/category.dart';
import 'package:nahjul_balagha/repositories/database_connection.dart';
import 'package:nahjul_balagha/widgets/Arabic.dart';
import 'package:nahjul_balagha/widgets/Farsi.dart';
import 'package:nahjul_balagha/widgets/Urdu.dart';


class MyBottomNavigation extends StatefulWidget {
  MyBottomNavigation(this.fav,this.id,this.atitle,this.textar,this.textfa,this.textfahekmat,this.textfakhotbe,this.textfanameh);
  String fav,id,atitle, textar, textfa,textfahekmat,textfakhotbe,textfanameh;
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    var a = widget.textfahekmat;
    print(a);
    List<Widget> _children = [
      arabic(widget.textar,widget.id,widget.fav),
      Urdu(widget.textfa,widget.id,widget.fav),
      Farsi(widget.textfakhotbe,widget.textfahekmat,widget.textfanameh,widget.id,widget.fav),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary_background,
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(widget.atitle,style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600
          ),),
        ),
        centerTitle: true,
      ),
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primary_background,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        // showElevation: true,
        // itemCornerRadius: 8,
        // curve: Curves.easeInBack,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_sharp),
            title: Text('Arabic',style: TextStyle(fontFamily: 'Lato-Bold',fontWeight: FontWeight.bold)),
            // inactiveColor: Colors.black,
            // activeColor: Colors.white,
            // textAlign: TextAlign.center,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_sharp),
            title: Text('Urdu',style: TextStyle(fontFamily: 'Lato-Bold',fontWeight: FontWeight.bold)),
            // inactiveColor: Colors.black,
            // activeColor: Colors.white,
            // textAlign: TextAlign.center,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_sharp),
            title: Text('Farsi',style: TextStyle(fontFamily: 'Lato-Bold',fontWeight: FontWeight.bold)),
            // inactiveColor: Colors.black,
            // activeColor: Colors.white,
            // textAlign: TextAlign.center,
          ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.assignment_sharp),
          //   title: Text('Urdu'),
          //   inactiveColor: Colors.black,
          //   activeColor: Colors.white,
          //   textAlign: TextAlign.center,
          // ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.assignment_sharp),
          //   title: Text('Farsi'),
          //   inactiveColor: Colors.black,
          //   activeColor: Colors.white,
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}