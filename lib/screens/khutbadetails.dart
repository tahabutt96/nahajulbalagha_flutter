import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/widgets/bottomnavigation.dart';

class khutbadetails extends StatelessWidget {
  khutbadetails(this.fav,this.id,this.atitle,this.textar,this.textfa,this.textfakhotbe,this.textfahekmat,this.textfanameh);
  String fav,id,atitle , textar, textfa, textfakhotbe,textfahekmat,textfanameh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: MyBottomNavigation(fav,id,atitle,textar,textfa,textfakhotbe,textfahekmat,textfanameh),
      ),
    );
  }
}
