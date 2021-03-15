class Category{
  int id, fav;
  String atitle, textar, textfa, textfanameh, textfahekmat, textfakhotbe;

  Category();

  Category.map(dynamic obj){
    this.id = obj['id'];
    this.fav = obj['fav'];
    this.atitle = obj['atitle'];
    this.textar = obj['textar'];
    this.textfa = obj['textfa'];
    this.textfanameh = obj['textfanameh'];
    this.textfakhotbe = obj['textfakhotbe'];
    this.textfahekmat = obj['textfahekmat'];
  }

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map['id'] = this.id;
    map['fav'] = this.fav;
    map['atitle'] = atitle;
    map['textar'] = textar;
    map['textfa'] = textfa;
    map['textfanameh'] = textfanameh;
    map['textfakhotbe'] = textfakhotbe;
    map['textfahekmat'] = textfahekmat;
  }
}