import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/models/category.dart';
import 'package:nahjul_balagha/repositories/database_connection.dart';
import 'package:nahjul_balagha/screens/favouritedetails.dart';
import 'package:nahjul_balagha/screens/homepage.dart';
import 'package:nahjul_balagha/widgets/bottomnavfavourite.dart';
import 'package:sqflite/sqflite.dart';

class favourites extends StatefulWidget {

  @override
  _favouritesState createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: FavBottomNav())
    );
  }
}
