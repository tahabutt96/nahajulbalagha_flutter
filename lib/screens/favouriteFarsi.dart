import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/models/category.dart';
import 'package:nahjul_balagha/repositories/database_connection.dart';
import 'package:nahjul_balagha/screens/favouritedetails.dart';
import 'package:nahjul_balagha/screens/homepage.dart';
import 'package:sqflite/sqflite.dart';

class favFarsi extends StatefulWidget {
  @override
  _favFarsiState createState() => _favFarsiState();
}

class _favFarsiState extends State<favFarsi> {
  DatabaseConnection dbconnect = DatabaseConnection.instance;
  List<Category> categories = new List();

  void abc (int id){
    setState(() {
      categories = List.from(categories)..removeAt(id);
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbconnect.getfavKhutbeList().then((rows) {
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
        body: categories.length == 0
            ? Center(child: Text("No Favourites Found.",style: TextStyle(fontFamily: 'Loto-Regular',fontSize: 18)))
            : ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          itemBuilder: (context,position){
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => favouritedetails(categories[position].fav.toString(),categories[position].id.toString(),categories[position].atitle,categories[position].textar,categories[position].textfa,categories[position].textfanameh,categories[position].textfahekmat,categories[position].textfakhotbe)));
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
                          child: ListTile(
                            trailing: IconButton(
                                onPressed: (){
                                  var nahjId = int.parse(categories[position].id.toString());
                                  var status = 0;
                                  print(nahjId);
                                  print(status);
                                  _update(status,nahjId);
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Removed to Favourite"),
                                  ));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
                                  // abc(categories[position].id);
                                },
                                icon: Icon(Icons.delete)),
                            //title: Text('${categories[position].id}', style: TextStyle(fontSize: 10.0),),
                            title: Text('${categories[position].atitle}', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
                            //trailing: Text('${categories[position].textar}', style: TextStyle(fontSize: 10.0),),
                            //leading: Text('${categories[position].textfa}', style: TextStyle(fontSize: 10.0),),
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
  _update(int favo, int myint) async {
    try{
      await dbconnect.setfavourite(favo,myint);
    } on DatabaseException catch (e){
      print("exception");
    }
  }
}
