import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahjul_balagha/models/category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection{
  static final _databaseName = 'nahjApp.db';
  static final _databseVersion = 1;
  static final table = 'nahjulBalagha';
  static final columnid = 'id';
  static final columnatitle = 'atitle';
  static final columntextar = 'textar';
  static final columntextfa = 'textfa';
  static final columfav = 'fav';
  static final textfanameh = 'textfanameh';
  static final textfakhotbe = 'textfakhotbe';
  static final textfahekmat = 'textfahekmat';

  DatabaseConnection._privateConstructor();
  static final DatabaseConnection instance = DatabaseConnection._privateConstructor();

  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDatabse();
    return _database;
  }

  _initDatabse() async{
    var databasePath = await getDatabasesPath();
    String path = join(databasePath,_databaseName);

    var exists = await databaseExists(path);
    if(!exists)
      {
        print("Copy database start");
        //if not exists
        try{
          await Directory(dirname(path)).create(recursive: true);
        }catch (_){}

        //Copy
        ByteData data = await rootBundle.load(join("assets",_databaseName));
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

        await File(path).writeAsBytes(bytes,flush: true);
      }else{
      print("Opening Existing Database");
    }
    return await openDatabase(path,version: _databseVersion);
  }

  Future<List> getkhutbaList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where subject = "khotbe"');
    return result.toList();
  }
  Future<List> getmaktoobList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where subject = "maktob"');
    return result.toList();
  }
  Future<List> gethikmatList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where subject = "hekmat"');
    return result.toList();
  }
  Future<List> getfavHitkmatList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where fav = 1 AND subject = "hekmat"');
    return result.toList();
  }
  Future<List> getfavMaktoobList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where fav = 1 AND subject = "maktob"');
    return result.toList();
  }
  Future<List> getfavKhutbeList() async{
    var db = await database;
    var result = await db.rawQuery('SELECT id,fav,atitle,textar,textfa, COALESCE(textfahekmat,"") textfahekmat,COALESCE(textfanameh,"") textfanameh,COALESCE(textfakhotbe,"") textfakhotbe FROM nahjulBalagha where fav = 1 AND subject = "khotbe"');
    return result.toList();
  }
  // Future<int> update(Category category) async{
  //   var db = await instance.database;
  //   return await db.update(table, category.toMap(), where: '$ID = ?',whereArgs: [category.id]);
  // }
  Future<int> setfavourite(fav,id) async{
    var db = await database;
    return await db.rawUpdate('''
    UPDATE ${DatabaseConnection.table}
    SET ${DatabaseConnection.columfav} = ?
    WHERE ${DatabaseConnection.columnid} = ?
    ''', [fav,id]);
  }
  Future close() async{
    var db = await database;
    db.close();
  }
  // Future<List> getfavouriteList() async{
  //   Database db = await instance.database;
  //   var result = await db.rawQuery('SELECT * FROM nahjulBalagha where subject = "khotbe"');
  //   return result.toList();
  // }
}