import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/models/category.dart';
import 'package:nahjul_balagha/repositories/database_connection.dart';
import 'package:nahjul_balagha/screens/favourites.dart';
import 'package:nahjul_balagha/screens/homepage.dart';
import 'package:share/share.dart';
import 'package:sqflite/sqflite.dart';

class arabic extends StatefulWidget {
  arabic(this.textar,this.id,this.fav);
  String textar,id,fav;
  @override
  _arabicState createState() => _arabicState();
}

class _arabicState extends State<arabic> {
  var textSize = 20.0;
  DatabaseConnection dbconnect = DatabaseConnection.instance;
  List<Category> categories = new List();
  bool toggle = false;
  bool addFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.fav == "1"){
      addFavorite = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    String text = widget.textar+"\n"+ "\n"+ "Hi, I have found beautiful Islamic App Nahajul Balagha on both Play store and App store. Download now by following this link https://play.google.com/store/apps/";
    String subject = 'Nahaj ul Balagha';
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(15),
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
                  child: Text(widget.textar,style: TextStyle(fontFamily: 'noorehuda',fontSize: textSize,fontWeight: FontWeight.w600),)),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              RaisedButton(
                onPressed: () {
                  if (textSize == 30){
                    textSize = textSize - 1.0;
                  }
                  setState(() {
                    textSize = textSize + 1.0;
                    print(textSize);
                  });
                },
                elevation: 2.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: primary_background,
                child: Icon(Icons.zoom_in_outlined),
              ),
              SizedBox(width: 5),
              RaisedButton(
                onPressed: () {
                  if (textSize == 18){
                    textSize = textSize + 1.0;
                  }
                  setState(() {
                    textSize = textSize - 1.0;
                    print(textSize);
                  });
                },
                elevation: 2.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: primary_background,
                child: Icon(Icons.zoom_out),
              ),
              SizedBox(width: 5),
              Expanded(
                child: RaisedButton.icon(
                  onPressed: () async{
                    var nahjId = int.parse(widget.id);
                    var favId = int.parse(widget.fav);
                    var status = 1;
                    int id = 1;
                    if(favId == 0){
                      _update(status,nahjId);
                      addFavorite = true;
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Added to Favourite"),
                      ));
                      Future.delayed(Duration(seconds: 2), () {
                        // 5s over, navigate to a new page

                      });
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => arabic(widget.fav,widget.id,w)));
                    }
                    else if(favId == 1){
                      var statuq = 0;
                      print(nahjId);
                      print(statuq);
                      _update(statuq,nahjId);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Removed to Favourite"),
                      ));
                      Future.delayed(Duration(seconds: 2), () {
                        // 5s over, navigate to a new page
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homepage()),(route) => false);
                      });
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                    }
                    // Setting the state
                    setState(() {
                      if(widget.fav == '1'){
                        addFavorite = true;
                      }
                      else if (widget.fav == "0"){
                        addFavorite = false;
                      }
                      addFavorite = !addFavorite;
                    });
                  },
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  color: primary_background,
                  icon: Icon(addFavorite ? Icons.favorite : Icons.favorite_border),
                  label: Text("Favourite",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: RaisedButton.icon(
                  onPressed: () {
                    final RenderBox box = context.findRenderObject();
                    Share.share(text,
                        subject: subject,
                        sharePositionOrigin:
                        box.localToGlobal(Offset.zero) &
                        box.size);
                  },
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  color: primary_background,
                  icon: Icon(Icons.share),
                  label: Text("Share",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
