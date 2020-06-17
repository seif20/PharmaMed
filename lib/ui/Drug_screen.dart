//import 'package:flutter/material.dart';
//import 'package:flutterbdd/model/user.dart';
//import 'package:flutterbdd/utils/database_helper.dart';
//import 'package:flutterbdd/model/Drug.dart';
//
//class DrugScreen extends StatefulWidget {
//  final Drug drug;
//
//  DrugScreen(this.drug);
//
//  @override
//  _DrugScreenState createState() => new _DrugScreenState();
//}
//
//class _DrugScreenState extends State<DrugScreen> {
//  DatabaseHelper db = new DatabaseHelper();
//
//  TextEditingController _namemedController;
//  TextEditingController _laboratoryController ;
//  TextEditingController _PresentationController ;
//  TextEditingController _concentinitController ;
//  TextEditingController _concentminController ;
//  TextEditingController _concentmaxController ;
//  TextEditingController _volumeController ;
//  TextEditingController _prixController ;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//    _namemedController = new TextEditingController(text: widget.drug.namemed);
//    _laboratoryController = new TextEditingController(text: widget.drug.laboratory);
//    _PresentationController = new TextEditingController(text: widget.drug.Presentation);
//    _concentinitController = new TextEditingController(text: widget.drug.concentinit);
//    _concentminController = new TextEditingController(text: widget.drug.concentmin);
//    _concentmaxController = new TextEditingController(text: widget.drug.concentmax);
//    _volumeController = new TextEditingController(text: widget.drug.volume);
//    _prixController = new TextEditingController(text: widget.drug.prix);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Preparation'),
//      ),
//      body:SingleChildScrollView(child :Container(
//        margin: EdgeInsets.all(15.0),
//        alignment: Alignment.center,
//        child: Column(
//          children: <Widget>[
//            TextField(
//              controller: _namemedController,
//              decoration: InputDecoration(labelText: 'Nom'),
//            ),
//            Padding(padding: EdgeInsets.all(5.0)),
//            TextField(
//              controller: _laboratoryController,
//              decoration: InputDecoration(labelText: 'Laboratoire'),
//            ),
//            Padding(padding: EdgeInsets.all(5.0)),
//            TextField(
//              controller: _PresentationController,
//              decoration: InputDecoration(labelText: 'Presentation'),
//            ),
//            Padding(padding: EdgeInsets.all(5.0)),
//            TextField(
//              controller: _concentinitController,
//              decoration: InputDecoration(labelText: 'Concentration initiale : '),
//            ),
//            Padding(padding: EdgeInsets.all(5.0)),
//            TextField(
//              controller: _concentminController,
//              decoration: InputDecoration(labelText: 'Concentration minimale : '),
//            ),
//            Padding(padding: EdgeInsets.all(5.0)),
//            TextField(
//              controller: _concentmaxController,
//              decoration: InputDecoration(labelText: 'Concentration maximale : '),
//            ),
//            Padding(padding: EdgeInsets.all(5.0)),
//            TextField(
//              controller: _volumeController,
//              decoration: InputDecoration(labelText: 'Volume : '),
//            ),
//            Padding(padding: EdgeInsets.all(5.0)),
//            TextField(
//              controller: _prixController,
//              decoration: InputDecoration(labelText: 'Prix: '),
//            ),
//            Padding(padding: EdgeInsets.all(5.0)),
//            RaisedButton(
//              child: (widget.drug.id != null)
//                  ? Text(
//                'update',
//                style: TextStyle(color: Colors.white),
//              )
//                  : Text(
//                'save',
//                style: TextStyle(color: Colors.white),
//              ),
//              color: Colors.deepPurpleAccent,
//              onPressed: () {
//                if (widget.drug.id != null) {
//                  db
//                      .updateDrug(Drug.fromMap({
//                    'id': widget.drug.id,
//                    'namemed': _namemedController.text,
//                    'laboratory': _laboratoryController.text,
//                    'Presentation': _PresentationController.text,
//                    'concentinit': _concentinitController.text,
//                    'concentmin': _concentminController.text,
//                    'oncentmax': _concentmaxController.text,
//                    'volume': _volumeController.text,
//                    'prix': _prixController.text,
//                  }))
//                      .then((_) {
//
//                    Navigator.pop(context , '');
//
//                  });
//                }
//
// else {
//                  db.saveDrug(Drug(
//                    _namemedController.text,
//                    _laboratoryController.text,
//                    _PresentationController.text,
//                    _concentinitController.text,
//                    _concentminController.text,
//                    _concentmaxController.text,
//                    _volumeController.text,
//                    _prixController.text,
//                  ))
//                      .then((_) {
//                    Navigator.pushNamed(context, "/PageOne");
//                  });
//                }
//              },
//            ),
//          ],
//        ),
//      )),
//    );
//  }
//}