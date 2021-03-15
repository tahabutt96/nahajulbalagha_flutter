import 'package:flutter/material.dart';
import 'package:nahjul_balagha/constants/constant_color.dart';
import 'package:nahjul_balagha/widgets/bottomnavigation.dart';

class maktoobdetails extends StatelessWidget {
  maktoobdetails(this.fav,this.id,this.atitle,this.textar,this.textfa,this.textfanameh,this.textfakhotbe,this.textfahekmat);
  String fav,id,atitle , textar, textfa, textfanameh,textfakhotbe,textfahekmat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: MyBottomNavigation(fav,id,atitle,textar,textfa,textfanameh,textfahekmat,textfakhotbe),
      ),
    );
  }
}
