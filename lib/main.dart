// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_2/acc_tracer.dart';
import 'package:flutter_application_2/angles.dart';
import 'package:flutter_application_2/euler_angles.dart';

import 'home.dart';
import 'location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByCar Demo',
      theme: ThemeData.light(),
      home: const MyHomePage(title: 'ByCar'),
    );
  }
}
// const MyHomePage(title: 'ByCar')
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 50,
                right:50, 
                bottom: 10
                ),
              child: TextFormField(
                controller: _usernameController,
                style: TextStyle(color: Colors.black,
                fontSize: 22),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              ), 

            Padding(
              padding: EdgeInsets.only(
                left: 50,
                right:50, 
                bottom: 10
                ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.black,
                fontSize: 22),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              ), 
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 10 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.purpleAccent,
                 ),
                child: MaterialButton(
                  onPressed: () {
                    print('Pressed');
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TracerPage())
                    );
                  },
                  child: Text('Submit'),
                  ),
              ),
               Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 10 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.amber,
                 ),
                child: MaterialButton(
                  onPressed: () {
                    print('Checked');
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapPage())
                    );
                  },
                  child: Text('Check'),
                  ),
              )
          ],
        ),
      ),
    );
  }
}
