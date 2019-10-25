import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sqljocky5/sqljocky.dart';

void main() => runApp(MyApp());

var settings = new ConnectionSettings(
    host: 'us-cdbr-iron-east-05.cleardb.net',
    port: 3306,
    user: 'b5c9452651a00d',
    password: '50e7f58f',
    db: 'healthapp');

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
            child: MaterialButton(
          onPressed: () {getGata();},
          child: Text('Press Me'),
        )),
      ),
    );
  }
}
