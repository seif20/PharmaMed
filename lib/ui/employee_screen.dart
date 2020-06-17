import 'package:flutter/material.dart';
import 'package:flutterbdd/model/user.dart';
import 'package:flutterbdd/utils/database_helper.dart';
import 'package:flutterbdd/model/Drug.dart';
import 'package:flutterbdd/utils/database_patient.dart';

class EmployeeScreen extends StatefulWidget{
  final Employee employee;
  EmployeeScreen(this.employee);

  @override
  _EmployeeScreenState createState() => new _EmployeeScreenState();

}

class _EmployeeScreenState extends State<EmployeeScreen> {

  DatabaseHelper db = new DatabaseHelper();

  TextEditingController _nameController;
  TextEditingController _laboratoryController ;
  TextEditingController _PresentationController ;
  TextEditingController _concentinitController ;
  TextEditingController _concentminController ;
  TextEditingController _concentmaxController ;
  TextEditingController _volumeController ;
  TextEditingController _prixController ;
  TextEditingController _namepatController;
  TextEditingController _firstnameController ;
  TextEditingController _sizeController ;
  TextEditingController _weightController ;
  TextEditingController _surfaceController ;
  TextEditingController _doseController ;
  TextEditingController _posologieController ;
  var x ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _nameController = new TextEditingController(text: widget.employee.name);
    _laboratoryController = new TextEditingController(text: widget.employee.laboratory);
    _PresentationController = new TextEditingController(text: widget.employee.Presentation);
    _concentinitController = new TextEditingController(text: widget.employee.concentinit);
    _concentminController = new TextEditingController(text: widget.employee.concentmin);
    _concentmaxController = new TextEditingController(text: widget.employee.concentmax);
    _volumeController = new TextEditingController(text: widget.employee.volume);
    _prixController = new TextEditingController(text: widget.employee.prix);
//    _namepatController = new TextEditingController(text: widget.employee.namepat);
//    _firstnameController = new TextEditingController(text: widget.employee.firstname);
//    _sizeController = new TextEditingController(text: widget.employee.size);
//    _weightController = new TextEditingController(text: widget.employee.weight);
//    _surfaceController = new TextEditingController(text: widget.employee.surface);
//    _doseController = new TextEditingController(text: widget.employee.dose);
//    _posologieController = new TextEditingController(text: widget.employee.posologie);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: new Text(
          "Préparer un médicament",
          style: new TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
      ),
      body:SingleChildScrollView(child :Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nom'),
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _laboratoryController,
              decoration: InputDecoration(labelText: 'Laboratoire'),
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _PresentationController,
              decoration: InputDecoration(labelText: 'Presentation'),
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _concentinitController,
              decoration: InputDecoration(labelText: 'Concentration initiale : '),
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _concentminController,
              decoration: InputDecoration(labelText: 'Concentration minimale : '),
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _concentmaxController,
              decoration: InputDecoration(labelText: 'Concentration maximale : '),
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _volumeController,
              decoration: InputDecoration(labelText: 'Volume après préparation : '),
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextField(
              controller: _prixController,
              decoration: InputDecoration(labelText: 'Prix du mg : '),
              style: TextStyle(fontSize: 22.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            RaisedButton(
              child: (widget.employee.id != null)
                  ? Text(
                'update',
                style: TextStyle(color: Colors.black
                ,fontSize: 20.0),
              )
                  : Text(
                'save',
                style: TextStyle(color: Colors.black,
                fontSize: 20.0),
              ),
              color: Colors.cyan,
              onPressed: () {
                if (widget.employee.id != null) {
                  db.updateEmployee(Employee.fromMap({
                    'id': widget.employee.id,
                    'name': _nameController.text,
                    'laboratory': _laboratoryController.text,
                    'Presentation': _PresentationController.text,
                    'concentinit': _concentinitController.text,
                    'concentmin': _concentminController.text,
                    'concentmax': _concentmaxController.text,
                    'volume': _volumeController.text,
                    'prix': _prixController.text,
                  }))
                      .then((_) {

                    Navigator.pop(context , 'update');

                  });
                }

                   else {
                  db.saveEmployee(Employee(

                    _nameController.text,
                    _laboratoryController.text,
                    _PresentationController.text,
                    _concentinitController.text,
                    _concentminController.text,
                    _concentmaxController.text,
                    _volumeController.text,
                    _prixController.text,




                  ))
                      .then((_) {
                    Navigator.pop(context, "save");
                  });
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}

