import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbdd/model/Drug.dart';
import 'package:flutterbdd/model/user_patient.dart';
import 'package:flutterbdd/ui/Listview_Patient.dart';
import 'package:flutterbdd/ui/employee_info.dart';
import 'package:flutterbdd/ui/employee_screen.dart';
import 'package:flutterbdd/ui/Prepare.dart';
import 'package:flutterbdd/ui/Drug_screen.dart';
import 'package:flutterbdd/ui/listview_employees.dart';
import 'package:flutterbdd/utils/database_helper.dart';
import 'package:flutterbdd/model/user.dart';



void main() => runApp(new MaterialApp(routes: <String, WidgetBuilder>{
  "/HomePage": (BuildContext context) => new HomePage(),
  "/PageOne": (BuildContext context) => new PageOne(),
  "/AddPatient": (BuildContext context) => new EmployeeScreen(
      Employee('', '', '', '', '', '', '', '')),
  "/Prepare": (BuildContext context) => new Prepare(Patient('', '', '', '', '', '', '','')),
  "/ListviewEmployees": (BuildContext context) => new ListViewEmployees(Employee('', '', '', '', '', '', '', '')),
  "/ListviewPatient": (BuildContext context) => new ListviewPatient(Patient('', '', '', '', '', '', '','')),
 // "/Drugscreen": (BuildContext context) => new DrugScreen(Drug('', '', '', '', '', '', '', '')),

}, home: new SplashScreen()));

//peremiere interface
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: new Text(
          "PharmaMed",
          style: new TextStyle(
            fontSize: 35.0,
            color: Colors.black
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
                image: AssetImage('images/app.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('',
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 50,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: const EdgeInsets.all(30),
                child: RaisedButton(
                  splashColor: Colors.orange,
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/HomePage");
                  },
                  color: Colors.cyan,
                  child: Text(
                    'Ouvrir',
                    style: TextStyle(fontSize: 45, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Login
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-1.png'))),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-2.png'))),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/clock.png'))),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Connexion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                      BorderSide(color: Colors.grey[100]))),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Adresse e-mail ou mobile",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mot de passe",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: Center(
                            child: Text(
                              "Connexion",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                        onTap: () {

                          Navigator.pushNamed(context, "/PageOne");
                        },

                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        "Informations de compte oubliées ?",
                        style:
                        TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

// Page principale
class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: new Text(
          "PharmaMed",
          style: new TextStyle(
            fontSize: 33.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
                image: AssetImage('images/app1.jpg'), fit: BoxFit.cover)),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              splashColor: Colors.blue,
              child: MyCustomCard("Liste des Patients", Icons.account_circle),
              onTap: () {
                Navigator.pushNamed(context, '/ListviewPatient');
              },
            ),

            InkWell(
              splashColor: Colors.blue,
              child: MyCustomCard("Liste des Médicaments", Icons.accessibility,
                  mycolor: Colors.green),
              onTap: () {
                Navigator.pushNamed(context, '/ListviewEmployees');
              },
            ),

          ],
        ),
      ),
    );
  }
}

//class Ar extends StatefulWidget {
//  @override
//  _ArState createState() => _ArState();
//}
//
//class _ArState extends State<Ar> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//    );
//  }
//}


Card MyCustomCard(String mytext, IconData myicon,
    {Color mycolor: Colors.redAccent}) {
  return new Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              myicon,
              size: 50.0,
              color: mycolor,
            ),
            new Text(
              mytext,
              style: new TextStyle(
                fontSize: 27.5,
              ),
            )
          ],
        )),
  );
}

//Ajouter un Patient

//class AddPatient extends StatefulWidget {
//  @override
//  _AddPatientState createState() => _AddPatientState();
//}
//
//class _AddPatientState extends State<AddPatient> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: new AppBar(
//          centerTitle: true,
//          title: Text(
//            "Ajouter un patient",
//            style: TextStyle(
//                fontSize: 27.0,
//                fontStyle: FontStyle.normal,
//                fontWeight: FontWeight.bold),
//          ),
//        ),
//        body: SingleChildScrollView(
//          child: Padding(
//            padding: const EdgeInsets.all(40.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  'Nom :',
//                  style: TextStyle(
//                    fontSize: 25.0,
//                  ),
//                ),
//                SizedBox(height: 10.0),
//                TextField(
//                  keyboardType: TextInputType.text,
//                  style: TextStyle(
//                    fontSize: 22.0,
//                    color: Colors.black,
//                    fontFamily: 'OpenSans',
//                  ),
//                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.only(top: 10.0, left: 20.0),
//                    hintText: 'Entrer le nom de patient',
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text(
//                  'Prénom :',
//                  style: TextStyle(
//                    fontSize: 25.0,
//                  ),
//                ),
//                SizedBox(
//                  height: 10.0,
//                ),
//                TextField(
//                  keyboardType: TextInputType.text,
//                  style: TextStyle(
//                    fontSize: 22.0,
//                    color: Colors.black,
//                    fontFamily: 'OpenSans',
//                  ),
//                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.only(top: 10.0, left: 20.0),
//                    hintText: 'Entrer le prénom de patient',
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text(
//                  'Poid :',
//                  style: TextStyle(
//                    fontSize: 25.0,
//                  ),
//                ),
//                SizedBox(
//                  height: 10.0,
//                ),
//                TextField(
//                  keyboardType: TextInputType.text,
//                  style: TextStyle(
//                    fontSize: 22.0,
//                    color: Colors.black,
//                    fontFamily: 'OpenSans',
//                  ),
//                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.only(top: 10.0, left: 20.0),
//                    hintText: 'Entrer le poid de patient',
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text(
//                  'Surface :',
//                  style: TextStyle(
//                    fontSize: 25.0,
//                  ),
//                ),
//                SizedBox(
//                  height: 10.0,
//                ),
//                TextField(
//                  keyboardType: TextInputType.text,
//                  style: TextStyle(
//                    fontSize: 22.0,
//                    color: Colors.black,
//                    fontFamily: 'OpenSans',
//                  ),
//                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.only(top: 10.0, left: 20.0),
//                    hintText: 'Entrer la surface de patient',
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text(
//                  'Médicament:',
//                  style: TextStyle(
//                    fontSize: 25.0,
//                  ),
//                ),
//                SizedBox(
//                  height: 10.0,
//                ),
//                TextField(
//                  keyboardType: TextInputType.text,
//                  style: TextStyle(
//                    fontSize: 22.0,
//                    color: Colors.black,
//                    fontFamily: 'OpenSans',
//                  ),
//                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.only(top: 10.0, left: 20.0),
//                    hintText: 'Entrer le médicament',
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Text(
//                  'Posologie :',
//                  style: TextStyle(
//                    fontSize: 25.0,
//                  ),
//                ),
//                SizedBox(
//                  height: 10.0,
//                ),
//                TextField(
//                  keyboardType: TextInputType.text,
//                  style: TextStyle(
//                    fontSize: 22.0,
//                    color: Colors.black,
//                    fontFamily: 'OpenSans',
//                  ),
//                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.only(top: 10.0, left: 20.0),
//                    hintText: 'Entrer la posologie',
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(
//                    left: 80.0,
//                    top: 25.0,
//                  ),
//                  child: RaisedButton(
//                    splashColor: Colors.blue,
//                    elevation: 15,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(50)),
//                    onPressed: () {},
//                    color: Colors.redAccent,
//                    child: Text(
//                      'Ajouter',
//                      style: TextStyle(fontSize: 32.5, color: Colors.white),
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//        ));
//  }
//}

// Péparer le médicament

//class Prepare extends StatefulWidget {
//  @override
//  _PrepareState createState() => _PrepareState();
//}
//
//class _PrepareState extends State<Prepare> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: new AppBar(
//          centerTitle: true,
//          title: Text(
//            "Préparer le médicament",
//            style: TextStyle(
//                fontSize: 25.0,
//                fontStyle: FontStyle.normal,
//                fontWeight: FontWeight.bold),
//          ),
//        ),
//        body: new Center());
//  }
//}







//Liste des médicaments

//class ListViewDrug extends StatefulWidget {
//  @override
//  _ListViewDrugState createState() => new _ListViewDrugState();
//}
//
//class _ListViewDrugState extends State<ListViewDrug> {
//  List<Employee> items = new List();
//  DatabaseHelper db = new DatabaseHelper();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//    db.getAllEmployees().then((employees) {
//      setState(() {
//        employees.forEach((employee) {
//          items.add(Employee.fromMap(employee));
//        });
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'All Drug',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('All Drug'),
//          centerTitle: true,
//          backgroundColor: Colors.deepPurpleAccent,
//        ),
//        body: Center(
//          child: ListView.builder(
//              itemCount: items.length,
//              padding: const EdgeInsets.all(15.0),
//              itemBuilder: (context, position) {
//                return Column(
//                  children: <Widget>[
//                    Divider(
//                      height: 5.0,
//                    ),
//                    Row(
//                      children: <Widget>[
//                        new Expanded(
//                            child: ListTile(
//                              title: Text(
//                                '${items[position].name}',
//                                style: TextStyle(
//                                    fontSize: 22.0, color: Colors.redAccent),
//                              ),
//                              subtitle: Text(
//                                '${items[position].firstname} ',
//                                style: TextStyle(
//                                  fontSize: 14.0,
//                                  fontStyle: FontStyle.italic,
//                                ),
//                              ),
//                              leading: Column(
//                                children: <Widget>[
//                                  Padding(padding: EdgeInsets.all(1.0)),
//                                  CircleAvatar(
//                                    backgroundColor: Colors.amber,
//                                    radius: 18.0,
//                                    child: Text(
//                                      '${items[position].id}',
//                                      style: TextStyle(
//                                          fontSize: 22.0, color: Colors.white),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                              onTap: () =>
//                                  _navigateToEmployeeInfo(context, items[position]),
//                            )),
//                        IconButton(
//                          icon: Icon(
//                            Icons.edit,
//                            color: Colors.blueAccent,
//                          ),
//                          onPressed: () =>
//                              _navigateToEmployee(context, items[position]),
//                        ),
//                        IconButton(
//                            icon: Icon(
//                              Icons.delete,
//                              color: Colors.red,
//                            ),
//                            onPressed: () => _deleteEmployee(
//                                context, items[position], position))
//                      ],
//                    ),
//                  ],
//                );
//              }),
//        ),
//        floatingActionButton: FloatingActionButton(
//            child: Icon(Icons.add),
//            backgroundColor: Colors.deepOrange,
//            onPressed: () => _createNewEmployee(context)),
//      ),
//    );
//  }
//
//  _deleteEmployee(BuildContext context, Employee employee, int position) async {
//    db.deleteEmployee(employee.id).then((employees) {
//      setState(() {
//        items.removeAt(position);
//      });
//    });
//  }
//
//  void _navigateToEmployee(BuildContext context, Employee employee) async {
//    String result = await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => EmployeeScreen(employee)),
//    );
//
//    if (result == 'update') {
//      db.getAllEmployees().then((employees) {
//        setState(() {
//          items.clear();
//          employees.forEach((employee) {
//            items.add(Employee.fromMap(employee));
//          });
//        });
//      });
//    }
//  }
//
//  void _navigateToEmployeeInfo(BuildContext context, Employee employee) async {
//    await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => EmployeeInfo(employee)),
//    );
//  }
//
//  void _createNewEmployee(BuildContext context) async {
//    String result = await Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) =>
//              EmployeeScreen(Employee('', '', '', '', '', ''))),
//    );
//
//    if (result == 'save') {
//      db.getAllEmployees().then((employees) {
//        setState(() {
//          items.clear();
//          employees.forEach((employee) {
//            items.add(Employee.fromMap(employee));
//          });
//        });
//      });
//    }
//  }
//}
//
