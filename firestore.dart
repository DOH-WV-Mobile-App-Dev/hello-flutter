import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sqljocky5/sqljocky.dart';

void main() => runApp(MyApp());

var settings = new ConnectionSettings(
    host: 'us-cdbr-iron-east-05.cleardb.net',
    port: 3306,
    user: 'b5c9452651a00d',
    password: '50e7f58f',
    db: 'healthapp');

Future getFireStoreData() async {
  Firestore.instance
  .collection('doh')
  .document('J8HEZWivoSGYfWkKsEr5')
  .get()
  .then((DocumentSnapshot s){
    print('==========data here===========');
    print(s.data['phone']);
  });
}

Future deleteData() async {
  Firestore.instance
  .collection('doh')
  .document('yYmrZGXrXySUhrQPku1a')
  .delete();
  print("========data deleted===========");
}

Future addData() async {
  Firestore.instance
  .collection('doh')
  .document()
  .setData({
    'name': 'jhgjhghj',
    'address':'dddddddddddddd',
    'phone': 'jgjhgjhg'
  });
}

Future getGata() async {
  // Open a connection (testdb should already exist)
  print('Connecting to mysql...');
  final conn = await MySqlConnection.connect(settings);
  print('Finished connection...');
  // Create a table
  Results results =
      (await conn.execute('select * from new_table')) as Results;

  print(results);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
            child: Column(children: <Widget>[
              MaterialButton(
                onPressed: (){getFireStoreData();},
                child: Text('Get Data'),
              ),
              MaterialButton(
                onPressed: (){deleteData();},
                child: Text('Delete Data'),
                ),
                MaterialButton(onPressed: (){addData();}, child: Text('Add Data'),)
            ],)),
      ),
    );
  }
}
