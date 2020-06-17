import 'package:flutter/material.dart';
import 'package:flutterbdd/main.dart';
import 'package:flutterbdd/model/user_patient.dart';
import 'package:flutterbdd/utils/database_helper.dart';
import 'package:flutterbdd/model/user.dart';
import 'package:flutterbdd/main.dart';

class PatientInfo extends StatefulWidget {
  final Patient patient;

  PatientInfo(this.patient);

  @override
  _PatientInfoState createState() => new _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  DatabaseHelper db = new DatabaseHelper();

  String namepat = '';
  String firstname = '';
  String size = '';
  String weight = '';
  String surface = '';
  String dose = '';
  String posologie = '';
  String name = '';

//
//  TextEditingController _ageController;
//  TextEditingController _nameController;
//  TextEditingController _departmentController;
//  TextEditingController _cityController;
//  TextEditingController _descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    namepat = widget.patient.namepat;
    firstname = widget.patient.firstname;
    size = widget.patient.size;
    weight = widget.patient.weight;
    surface = widget.patient.surface;
    dose = widget.patient.dose;
    posologie = widget.patient.posologie;
    name = widget.patient.name;


//      _ageController = new TextEditingController(text: widget.employee.age);
//      _nameController = new TextEditingController(text: widget.employee.name);
//      _departmentController = new TextEditingController(text: widget.employee.department);
//      _cityController = new TextEditingController(text: widget.employee.city);
//      _descriptionController = new TextEditingController(text: widget.employee.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informations de Médicament",
          style: TextStyle(color: Colors.black, fontSize: 22.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        //   alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Nom : $namepat',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),textDirection: TextDirection.ltr,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Prénom : $firstname',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Taille : $size',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Poids : $weight' + '',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Surface : $surface' + '',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Médicament : $namepat' + '',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Médicament : $name' + '',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Dose : $dose' + '',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Posologie : $posologie' + '',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,

              ), textDirection: TextDirection.ltr,
              maxLines: 10,
            ),
            Padding(padding: EdgeInsets.only(top: 60.0)),
          ],
        ),
      ),
    );
  }
}
