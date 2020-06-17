import 'package:flutter/material.dart';
import 'package:flutterbdd/model/user_patient.dart';
import 'package:flutterbdd/model/user.dart';
import 'package:flutterbdd/ui/Listview_Patient.dart';
import 'package:flutterbdd/ui/Patient_info.dart';
import 'package:flutterbdd/utils/database_helper.dart';
import 'package:flutterbdd/utils/database_patient.dart';
import 'package:flutterbdd/main.dart';
import 'package:flutterbdd/ui/employee_screen.dart' ;

class Prepare extends StatefulWidget {
  final Patient patient;
  Prepare(this.patient);

  @override
  _PrepareState createState() => _PrepareState();
}

class _PrepareState extends State<Prepare> {


  DatabasePatient db = new DatabasePatient();

  TextEditingController _namepatController;
  TextEditingController _firstnameController ;
  TextEditingController _sizeController ;
  TextEditingController _weightController ;
  TextEditingController _surfaceController ;
  TextEditingController _doseController ;
  TextEditingController _posologieController ;
  TextEditingController _nameController;
  TextEditingController _laboratoryController ;
  TextEditingController _PresentationController ;
  TextEditingController _concentinitController ;
  TextEditingController _concentminController ;
  TextEditingController _concentmaxController ;
  TextEditingController _volumeController ;
  TextEditingController _prixController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _namepatController = new TextEditingController(text: widget.patient.namepat);
    _firstnameController = new TextEditingController(text: widget.patient.firstname);
    _sizeController = new TextEditingController(text: widget.patient.size);
    _weightController = new TextEditingController(text: widget.patient.weight);
    _surfaceController = new TextEditingController(text: widget.patient.surface);
    _doseController = new TextEditingController(text: widget.patient.dose);
    _posologieController = new TextEditingController(text: widget.patient.posologie);
    _nameController = new TextEditingController(text: widget.patient.name);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Préparer un patient' , style: TextStyle(fontSize: 28.0 , color: Colors.black),),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _namepatController,
                decoration: InputDecoration(labelText: 'Nom'),
                style: TextStyle(fontSize: 20.0),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              TextField(
                controller: _firstnameController,
                decoration: InputDecoration(labelText: 'Prénom '),
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: _sizeController,
                decoration: InputDecoration(labelText: 'Taille '),
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: _weightController,
                decoration: InputDecoration(labelText: 'Poids '),
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Médicament '),
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: _doseController,
                decoration: InputDecoration(labelText: 'Dose '),
                style: TextStyle(fontSize: 20.0),
              ),
              TextField(
                controller: _posologieController,
                decoration: InputDecoration(labelText: 'Posologie '),
                style: TextStyle(fontSize: 20.0),
              ),
              Padding(padding: EdgeInsets.all(25.0)),
              RaisedButton(child: Text('save'), onPressed: (){

                db.savePatient(Patient(

                  _namepatController.text,
                  _firstnameController.text,
                  _sizeController.text,
                  _weightController.text,
                  _surfaceController.text,
                  _nameController.text,
                  _doseController.text,
                  _posologieController.text,

                ))

                .then((_) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder:(context) => ListviewPatient(Patient('', '', '', '', '','$_nameController', '',''))
                  ));
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
