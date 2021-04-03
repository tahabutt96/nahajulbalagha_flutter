import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/models/category.dart';
import 'package:nahjul_balagha/repositories/database_connection.dart';
import 'package:nahjul_balagha/screens/hikmatdetails.dart';
import 'package:sqflite/sqflite.dart';

class hikmatlist extends StatefulWidget {
  @override
  _hikmatlistState createState() => _hikmatlistState();
}

class _hikmatlistState extends State<hikmatlist> {

  DatabaseConnection dbconnect = DatabaseConnection.instance;
  List<Category> categories = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbconnect.gethikmatList().then((rows) {
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
        appBar: AppBar(
          backgroundColor: primary_background,
          title: Text("Hikmat"),
          centerTitle: true,
        ),
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
                  Material(color: button_background,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: InkWell(
                        onTap: (){
                          print(categories[position].fav);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => hikmatdetails(categories[position].fav.toString(),categories[position].id.toString(),categories[position].atitle,categories[position].textar,categories[position].textfa,categories[position].textfahekmat,categories[position].textfanameh,categories[position].textfakhotbe)));
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
                              leading: Padding(
                                padding: const EdgeInsets.only(top:5.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primary_background,
                                  child: Text(a.toString(), style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white),),
                                ),
                              ),
                              subtitle: Padding(
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
