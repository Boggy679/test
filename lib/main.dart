import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quiz/DIoHelper.dart';

void main() {
  runApp(MyApp());
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Generator',
      home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Text("Below is the the button for generator",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue.shade800, ),)
              ),
              new Roller(),
            ],
          )
      ),
    );
  }
}

class Roller extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return TheRandom();
  }
}

class TheRandom extends State<Roller>{
  String randomNumber = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(7),
            child: ElevatedButton(
                child: Text("Click here"),
                onPressed: () {
                  DioHelper.getData(
                    url: "csrng/csrng.php",
                    query: {
                      'min': '0',
                      'max': '1000',
                    },
                  ).then((number) {
                    setState(() {
                      randomNumber = (number.data[0]['random']).toString();
                    });
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              "$randomNumber",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}