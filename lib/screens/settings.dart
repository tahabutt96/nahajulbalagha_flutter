import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/screens/languagealert.dart';
import 'package:nahjul_balagha/screens/settingsalert.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary_background,
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(right:15.0),
                         child: Icon(Icons.notification_important),
                       ),
                       Text(
                         "Notifications",style: TextStyle(fontSize: 22,fontFamily: 'Loto-Regular'),
                       ),
                     ],
                   ),
                   ElevatedButton(
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsAlert()));
                     },
                     style: ElevatedButton.styleFrom(primary: primary_background),
                     child: const Text('Edit', style: TextStyle(fontSize: 20)),
                   ),
                 ],
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:15.0),
                        child: Icon(Icons.language),
                      ),
                      Text(
                        "Language",style: TextStyle(fontSize: 22,fontFamily: 'Loto-Regular'),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageAlert()));
                    },
                    style: ElevatedButton.styleFrom(primary: primary_background),
                    child: const Text('Edit', style: TextStyle(fontSize: 20)),
                  ),
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}
