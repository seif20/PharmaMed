import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbdd/utils/database_helper.dart';
import 'package:flutterbdd/model/user.dart';
import 'package:flutterbdd/ui/employee_screen.dart';
import 'package:flutterbdd/ui/employee_info.dart';

class ListViewEmployees extends StatefulWidget {
  final Employee employee;
  ListViewEmployees(this.employee);
  @override
  _ListViewEmployeesState createState() => new _ListViewEmployeesState();
}

class _ListViewEmployeesState extends State<ListViewEmployees> {
  List<Employee> items = List();
  List<Employee> filterUsers  = List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    db.getAllEmployees().then((employees) {
      setState(() {
       items = List() ;
       filterUsers = items ;
        employees.forEach((employee) {
          items.add(Employee.fromMap(employee));

        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Les Médicaments',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
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
                   onChanged: (string){
                    setState(() {
                      filterUsers = items.where((u)=>
                      (u.name.toLowerCase().contains(string.toLowerCase()))).toList();

                    });

                   }
                ),

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
                              '${filterUsers[position].name}',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.redAccent),
                            ),
                            subtitle: Text(
                              '${filterUsers[position].laboratory}',
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
                                    '${filterUsers[position].id}',
                                    style: TextStyle(
                                        fontSize: 24.0, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () => _navigateToEmployeeInfo(
                                context, items[position]),
                          )),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () =>
                                _navigateToEmployee(context, items[position]),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => _deleteEmployee(
                                  context, items[position], position))
                        ],
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          foregroundColor: Colors.black,
          backgroundColor: Colors.cyan,
          onPressed: () => _createNewEmployee(context)),
    );
  }

  _deleteEmployee(BuildContext context, Employee employee, int position) async {
    db.deleteEmployee(employee.id).then((employees) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  _getEmployee(BuildContext context, Employee employee, int position) async {
    db.getEmployee(employee.id).then((employees) {
      setState(() {
        items.removeAt(position);

      });
    });
  }

  void _navigateToEmployee(BuildContext context, Employee employee) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeScreen(employee)),
    );

    if (result == 'update') {
      db.getAllEmployees().then((employees) {
        setState(() {
          items.clear();
          employees.forEach((employee) {
            items.add(Employee.fromMap(employee));
          });
        });
      });
    }
  }

  void _navigateToEmployeeInfo(BuildContext context, Employee employee) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeInfo(employee)),
    );
  }

  void _createNewEmployee(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EmployeeScreen(Employee('', '', '', '', '', '', '', ''))),
    );

    if (result == 'save') {
      db.getAllEmployees().then((employees) {
        setState(() {
          items.clear();
          employees.forEach((employee) {
            items.add(Employee.fromMap(employee));
          });
        });
      });
    }
  }
}
