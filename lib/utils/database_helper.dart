import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterbdd/model/user.dart';
import 'package:flutterbdd/model/Drug.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutterbdd/ui/listview_employees.dart';

class DatabaseHelper{

  final String tableEmployee = 'employeeTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnLabo = 'laboratory' ;
  final String columnPresen = 'Presentation' ;
  final String columnConcentInit = 'concentinit' ;
  final String columnConcentMin = 'concentmin' ;
  final String columnConcentMax = 'concentmax' ;
  final String columnVolume = 'volume' ;
  final String columnPrix = 'prix' ;






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
    String path = join(databasePath , 'Ped.db');
    var db = await openDatabase(path , version: 2, onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db , int newVersion) async{
    var sql = 'CREATE TABLE $tableEmployee ($columnId INTEGER PRIMARY KEY,'
        '$columnName TEXT ,$columnLabo TEXT ,'
        '$columnPresen TEXT ,$columnConcentInit TEXT ,$columnConcentMin TEXT ,$columnConcentMax TEXT,'
        '$columnVolume TEXT ,$columnPrix TEXT )';
    await db.execute(sql);
  }


  Future<int> saveEmployee(Employee employee) async{
    var dbClient = await db;
    var result = await dbClient.insert(  tableEmployee , employee.toMap() );
    return result;
  }


  Future<List> getAllEmployees() async{
    var dbClient = await db;
    var sql = 'SELECT * FROM $tableEmployee ';
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }



//  Future<int> getCount() async{
//    var dbClient = await db;
//
//    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableEmploye'));
//  }


  Future<Employee> getEmployee(int id) async{
    var dbClient = await db;
    List result = await dbClient.query(
        tableEmployee ,
        columns: [columnId,columnName,
          columnLabo,columnPresen ,columnConcentInit,
          columnConcentMin,columnConcentMax,columnVolume,columnPrix],where: '$columnId = ?',whereArgs: ['id']

    );
    if(result.length > 0){
      return new Employee.fromMap(result.first);
    }

    return null;
  }

  Future<int> updateEmployee(Employee employee)async{
    var dbClient = await db;
    return await dbClient.update(
        tableEmployee , employee.toMap(), where: '$columnId = ?',whereArgs: [ employee.id ]
    );

  }


  Future<int> deleteEmployee(int id)async{
    var dbClient = await db;
    return await dbClient.delete(
        tableEmployee ,   where: '$columnId = ?',whereArgs: [id]
    );
  }


  Future  close()async{
    var dbClient = await db;
    return await dbClient.close();
  }


}
