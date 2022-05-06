// ignore_for_file: import_of_legacy_library_into_null_safe
// ignore: unused_import
import 'dart:math';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sensors/sensors.dart';
import 'package:intl/intl.dart';


class TracerPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TracerPage({Key? key}) : super(key: key);

  @override
  _TracerPageState createState() => _TracerPageState();
}

class _TracerPageState extends State<TracerPage> {
  late double x, y, z;
  late double a, b, c;

  @override
  void initState(){
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });

    accelerometerEvents.listen((AccelerometerEvent newevent) {
      setState(() {
        a = newevent.x;
        b = newevent.y;
        c = newevent.z;
      });
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensors library'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                "Flutter sensor gyroscope work",
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
              ),
              Table(
                border: TableBorder.all(
                  width: 2.0,
                  color: Colors.purple,
                  style: BorderStyle.solid
                ),
                children: [
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "TimeSTAMP ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(DateFormat('yyyy-MM-dd KK:mm:ss').format(DateTime.now()),
                        style: const TextStyle(fontSize: 20.0)),
                        )
                    ]
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "X Axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text((x * (180 / 3.14)).toStringAsFixed(2),
                        style: const TextStyle(fontSize: 20.0)),
                        )
                    ]
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text(
                          "Y Axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text((y * (180 / 3.14)).toStringAsFixed(2),  //trim the asis value to 2 digit after decimal point
                            style: const TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Z Axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0), 
                        child: Text((z * (180 / 3.14)).toStringAsFixed(2),   //trim the asis value to 2 digit after decimal point
                            style: const TextStyle(fontSize: 20.0)),  
                      )
                    ],
                  ),
                ],
              ),
              const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Flutter sensor accelerometer work",
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
              ),
              Table(
                border: TableBorder.all(
                  width: 2.0,
                  color: Colors.purple,
                  style: BorderStyle.solid
                ),
                children: [
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "X Axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(a.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 20.0)),
                        )
                    ]
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text(
                          "Y Axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(b.toStringAsFixed(2),  //trim the asis value to 2 digit after decimal point
                            style: const TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Z Axis: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0), 
                        child: Text(c.toStringAsFixed(2),   //trim the asis value to 2 digit after decimal point
                            style: const TextStyle(fontSize: 20.0)),  
                      )
                    ],
                  ),
                ],
              )
          ],) ),
    );
  }
}