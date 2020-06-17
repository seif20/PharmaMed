class Employee{

  int _id ;
  String _name;
  String _laboratory ;
  String _Presentation ;
  String _concentinit ;
  String _concentmin ;
  String _concentmax ;
  String _volume ;
  String _prix ;



  Employee(
      this._name,
      this._laboratory,
      this._Presentation,
      this._concentinit,
      this._concentmin,
      this._concentmax,
      this._volume,
      this._prix,


      );

  Employee.map(dynamic obj){

    this._id = obj['id'];
    this._name = obj['name'];
    this._laboratory = obj['laboratory'];
    this._Presentation = obj['Presentation'];
    this._concentinit = obj['concentinit'];
    this._concentmin = obj['concentmin'];
    this._concentmax = obj['concentmax'];
    this._volume = obj['volume'];
    this._prix = obj['prix'];




  }

    int get id => _id;
    String get name => _name;
    String get laboratory => _laboratory;
    String get Presentation => _Presentation;
    String get concentinit => _concentinit;
    String get concentmin => _concentmin;
    String get concentmax => _concentmax;
    String get volume => _volume;
    String get prix => _prix;



  Map<String , dynamic > toMap(){
    var map = new Map<String , dynamic>();
    if(_id != null){
      map['id'] = _id;

    }

    map['name'] = _name;
    map['laboratory'] = _laboratory;
    map['Presentation'] = _Presentation;
    map['concentinit'] = _concentinit;
    map['concentmin'] = _concentmin;
    map['concentmax'] = _concentmax;
    map['volume'] = _volume;
    map['prix'] = _prix;


    return map;
  }

  Employee.fromMap(Map<String , dynamic> map){

    this._id = map['id'] ;
    this._name = map['name'];
    this._laboratory = map['laboratory'];
    this._Presentation = map['Presentation'];
    this._concentinit = map['concentinit'];
    this._concentmin = map['concentmin'];
    this._concentmax = map['concentmax'];
    this._volume = map['volume'];
    this._prix = map['prix'];




  }


}