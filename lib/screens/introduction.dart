import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/screens/hikmatlist.dart';
import 'package:nahjul_balagha/screens/khutbalist.dart';
import 'package:nahjul_balagha/screens/maktooblist.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => maktooblist()));
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: button_background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("Maktoob",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600,fontFamily: 'SocialSites',color: Colors.black),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => hikmatlist()));
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: button_background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("Hikmat",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600,fontFamily: 'SocialSites',color: Colors.black),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => khutbalist()));
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: button_background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("Khutba",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600,fontFamily: 'SocialSites',color: Colors.black),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
