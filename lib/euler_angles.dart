import 'package:euler_angles/euler_angles.dart';
import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math.dart' show radians;


class AnglePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AnglePage({Key? key}) : super(key: key);

  @override
  _AnglePageState createState() => _AnglePageState();
}

class _AnglePageState extends State<AnglePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // // calculate average values from moving window
    // ignore: unused_local_variable
    var pitch =
        window.map((it) => it.pitch).reduce((width, height) => width + height);
    // ignore: avoid_print
    print(pitch);
    print(height);
    print(width);
    // ignore: unused_local_variable
    var yaw =
        window.map((it) => it.yaw);

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
              child: Text(pitch.toString(),  //trim the asis value to 2 digit after decimal point
                            style: const TextStyle(fontSize: 20.0)),
              )],
        )
      )
   );
  }

  @override
  void initState() {
    super.initState();
    EulerAngles.addListener(onData);
  }

  var window = <EulerSensorData>[];

  void onData(EulerSensorData value) {
    setState(() {
      if (window.length > 50) {
        window.removeAt(0);
      }
      window.add(value);
    });
  }
}