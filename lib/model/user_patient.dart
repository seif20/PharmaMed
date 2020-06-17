class Patient{

  int _idpat ;
  String _namepat ;
  String _firstname ;
  String _size ;
  String _weight ;
  String _surface ;
  String _name ;
  String _dose ;
  String _posologie ;

  Patient(

      this._namepat,
      this._firstname,
      this._size,
      this._weight,
      this._surface,
      this._name,
      this._dose,
      this._posologie,

      );

  Patient.map(dynamic obj){

    this._idpat = obj['idpat'];
    this._namepat = obj['namepat'];
    this._firstname = obj['firstname'];
    this._size = obj['size'];
    this._weight = obj['weight'];
    this._surface = obj['surface'];
    this._name = obj['name'];
    this._dose = obj['dose'];
    this._posologie = obj['posologie'];

  }


  int get idpat => _idpat;
  String get namepat => _namepat;
  String get firstname => _firstname;
  String get size => _size;
  String get weight => _weight;
  String get surface => _surface;
  String get name => _name;
  String get dose => _dose;
  String get posologie => _posologie;


  Map<String , dynamic > toMap(){
    var map = new Map<String , dynamic>();
    if(_idpat != null){
      map['idpat'] = _idpat;

    }

    map['namepat'] = _namepat;
    map['firstname'] = _firstname;
    map['size'] = _size;
    map['weight'] = _weight;
    map['surface'] = _surface;
    map['name'] = _name;
    map['dose'] = _dose;
    map['posologie'] = _posologie;


    return map;
  }

  Patient.fromMap(Map<String , dynamic> map){

    this._idpat = map['idpat'] ;
    this._namepat = map['namepat'];
    this._firstname = map['firstname'];
    this._size = map['size'];
    this._weight = map['weight'];
    this._surface = map['surface'];
    this._name = map['name'];
    this._dose = map['dose'];
    this._posologie = map['posologie'];



  }


}