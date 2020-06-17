import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterbdd/model/user.dart';
import 'package:flutterbdd/model/user_patient.dart';
import 'package:flutterbdd/model/Drug.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutterbdd/ui/listview_employees.dart';

class DatabasePatient{

  final String tablePatient = 'patienttable';
  final String columnIdpat = 'idpat' ;
  final String columnNamePat = 'namepat' ;
  final String columnFirstname = 'firstname' ;
  final String columnSize = 'size' ;
  final String columnWeight = 'weight' ;
  final String columnSurface = 'surface' ;
  final String columnName = 'name' ;
  final String columnDose = 'dose' ;
  final String columnPosologie = 'posologie' ;



  static Database _db ;

  Future<Database> get db async{
    if(_db != null){
      return _db ;
    }
    _db = await initDb();

    return _db;
  }

  initDb()async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath , 'Dwa.db');
    var db = await openDatabase(path , version: 3, onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db , int newVersion) async{
    var sql = 'CREATE TABLE $tablePatient ($columnIdpat INTEGER PRIMARY KEY,'
        '$columnNamePat TEXT ,$columnFirstname TEXT ,$columnSize TEXT ,'
        '$columnWeight TEXT,$columnSurface TEXT ,$columnDose TEXT,$columnName TEXT ,$columnPosologie TEXT )';
    await db.execute(sql);
  }


  Future<int> savePatient(Patient patient) async{
    var dbClient = await db;
    var result = await dbClient.insert(  tablePatient , patient.toMap() );
    return result;
  }


  Future<List> getAllPatient() async{
    var dbClient = await db;
    var sql = 'SELECT * FROM $tablePatient ';
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }



//  Future<int> getCount() async{
//    var dbClient = await db;
//
//    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableEmploye'));
//  }


  Future<Employee> getPatient(int idpat) async{
    var dbClient = await db;
    List result = await dbClient.query(
        tablePatient ,
        columns: [columnIdpat,columnNamePat,columnFirstname,
          columnSize,columnWeight,columnSurface,columnName,columnDose,columnPosologie],where: '$columnIdpat = ?',whereArgs: ['idpat']

    );
    if(result.length > 0){
      return new Employee.fromMap(result.first);
    }

    return null;
  }

//  Future<int> updatePatient(Employee employee)async{
//    var dbClient = await db;
//    return await dbClient.update(
//        tablePatient , employee.toMap(), where: '$columnIdpat = ?',whereArgs: [ employee.idpat ]
//    );
//  }


  Future<int> deletePatient(int idpat)async{
    var dbClient = await db;
    return await dbClient.delete(
        tablePatient ,   where: '$columnIdpat = ?',whereArgs: [idpat]
    );
  }


  Future  close()async{
    var dbClient = await db;
    return await dbClient.close();
  }


}
