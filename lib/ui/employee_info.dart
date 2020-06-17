import 'package:flutter/material.dart';
import 'package:flutterbdd/main.dart';
import 'package:flutterbdd/model/user_patient.dart';
import 'package:flutterbdd/ui/Prepare.dart';
import 'package:flutterbdd/utils/database_helper.dart';
import 'package:flutterbdd/model/user.dart';
import 'package:flutterbdd/main.dart';

class EmployeeInfo extends StatefulWidget {
  final Employee employee;
  EmployeeInfo(this.employee);

  @override
  _EmployeeInfoState createState() => new _EmployeeInfoState();
}

class _EmployeeInfoState extends State<EmployeeInfo> {
  DatabaseHelper db = new DatabaseHelper();

  String name = '';
  String laboratory = '';
  String Presentation = '';
  String concentinit = '';
  String concentmin = '';
  String concentmax = '';
  String volume = '';
  String prix = '';

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

    name = widget.employee.name;
    laboratory = widget.employee.laboratory;
    Presentation = widget.employee.Presentation;
    concentinit = widget.employee.concentinit;
    concentmin = widget.employee.concentmin;
    concentmax = widget.employee.concentmax;
    volume = widget.employee.volume;
    prix = widget.employee.prix;

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
              'Nom : $name',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),textDirection: TextDirection.ltr,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Laboratoire : $laboratory',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),

            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Présentation : $Presentation',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Concentration initiale : $concentinit' + ' mg/ml',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Concentration minimale : $concentmin' + ' mg/ml',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Concentration maximale : $concentmax' + ' mg/ml',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Volume après préparation  : $volume' + ' mg/ml',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,

              ), textDirection: TextDirection.ltr,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'Prix du mg :  $prix' + ' DA',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
              maxLines: 10,
            ),
            Padding(padding: EdgeInsets.only(top: 60.0)),
            RaisedButton(
                child: Text(
                  'Préparer',
                  style: TextStyle(fontSize: 27.0),
                ),
                splashColor: Colors.grey,
                elevation: 15.0,
                color: Colors.cyan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder:(context) => Prepare(Patient('', '', '', '', '','$name', '',''))
                  ));
                })
          ],
        ),
      ),
    );
  }
}
