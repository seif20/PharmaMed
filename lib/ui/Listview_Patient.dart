import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbdd/model/user_patient.dart';
import 'package:flutterbdd/utils/database_helper.dart';
import 'package:flutterbdd/utils/database_patient.dart';
import 'package:flutterbdd/model/user.dart';
import 'package:flutterbdd/ui/employee_screen.dart';
import 'package:flutterbdd/ui/employee_info.dart';

import 'Patient_info.dart';

class ListviewPatient extends StatefulWidget {

  final Patient patient;
  ListviewPatient(this.patient);

  @override
  _ListviewPatientState createState() => _ListviewPatientState();
}

class _ListviewPatientState extends State<ListviewPatient> {
  List<Patient> items = List();
  List<Patient> filterUsers = List();
  DatabasePatient db = new DatabasePatient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    db.getAllPatient().then((patients) {
      setState(() {
        items = List();
        filterUsers = items;
        patients.forEach((patient) {
          items.add(Patient.fromMap(patient));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Les Patients', style: TextStyle(fontSize: 25.0 , color: Colors.black),),
      centerTitle: true,
      backgroundColor: Colors.cyan),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              child: ListTile(
                leading: InkWell(
                  child: new Icon(Icons.search),
                ),
                title: new TextField(
                    decoration: new InputDecoration(
                        hintText: 'Chercher', border: InputBorder.none),
                    onChanged: (string) {
                      setState(() {
                        filterUsers = items.where((u) => (u.namepat
                                .toLowerCase()
                                .contains(string.toLowerCase())))
                            .toList();
                      });
                    }),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filterUsers.length,
                padding: const EdgeInsets.all(15.0),
                itemBuilder: (context, position) {
                  return Column(
                    children: <Widget>[
                      Divider(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[
                          new Expanded(
                              child: ListTile(
                            title: Text(
                              '${filterUsers[position].namepat}',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.redAccent),
                            ),
                            subtitle: Text(
                              '${filterUsers[position].firstname}',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            leading: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(1.0)),
                                CircleAvatar(
                                  backgroundColor: Colors.cyan,
                                  radius: 18.0,
                                  child: Text(
                                    '${filterUsers[position].idpat}',
                                    style: TextStyle(
                                        fontSize: 24.0, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () => _navigateToPatientInfo(
                                context, items[position]),
                          )),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => _deletePatient(
                                  context, items[position], position))
                        ],
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  _deletePatient(BuildContext context, Patient patient, int position) async {
    db.deletePatient(patient.idpat).then((patients) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToPatientInfo(BuildContext context, Patient patient) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientInfo(patient)),
    );
  }
}
