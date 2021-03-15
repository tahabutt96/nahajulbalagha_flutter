import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/models/category.dart';
import 'package:nahjul_balagha/repositories/database_connection.dart';
import 'package:nahjul_balagha/screens/maktoobdetails.dart';
import 'package:sqflite/sqflite.dart';

class maktooblist extends StatefulWidget {
  @override
  _maktooblistState createState() => _maktooblistState();
}

class _maktooblistState extends State<maktooblist> {

  DatabaseConnection dbconnect = DatabaseConnection.instance;
  List<Category> categories = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbconnect.getmaktoobList().then((rows) {
      setState(() {
        rows.forEach((row) {
          categories.add(Category.map(row));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          itemBuilder: (context,position){
            int a = position + 1;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(height: 2.0,),
                  Material(color: button_background,child:
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => maktoobdetails(categories[position].fav.toString(),categories[position].id.toString(),categories[position].atitle,categories[position].textar,categories[position].textfa,categories[position].textfanameh,categories[position].textfahekmat,categories[position].textfakhotbe)));
                      },
                      child: Container(
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
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            // leading: CircleAvatar(
                            //   radius: 23,
                            //   backgroundColor: primary_background,
                            //   child: Text(a.toString(), style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white),),
                            // ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                              child: Text('${categories[position].atitle}', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,fontFamily: 'SocialSites',color: Colors.black),),
                            ),
                            //trailing: Text('${categories[position].textar}', style: TextStyle(fontSize: 10.0),),
                            //leading: Text('${categories[position].textfa}', style: TextStyle(fontSize: 10.0),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }
}
