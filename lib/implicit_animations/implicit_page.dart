import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'hero_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HeroPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var mWidth = 100.0;

  var mHeight = 100.0;

  var mColor = Colors.blue;

  var mRadius = 0.0;

  var mOpacity = 1.0;

  var mAlignment = Alignment.bottomLeft;

  var padding =11.0;
  
  bool firstVisible = true;

  var list = [
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
    /*Timer(Duration(milliseconds: 200), (){
            mWidth = 200.0;
            mHeight = 300.0;
            setState(() {

            });
          });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foo Animations'),
      ),
      body: InkWell(
        onTap: (){
          /*double random = Random().nextInt(500).toDouble();
          mWidth = random;
          mHeight = random;
          mColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
          mRadius = Random().nextInt(50).toDouble();*/
          firstVisible = !firstVisible;
          setState(() {

          });
        },
        child: AnimatedCrossFade(
          duration: Duration(seconds: 2),
          firstChild: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          secondChild: SizedBox(
            width: 200,
            height: 200,
            child: Image.network("https://www.nagarro.com/hubfs/Flutter-Logo-LP.png"),
          ),
          crossFadeState: firstVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}

//AnimatedContainer(
//             duration: Duration(seconds: 2),
//             width: mWidth,
//             height: mHeight,
//             decoration: BoxDecoration(
//               color: mColor,
//               borderRadius: BorderRadius.circular(mRadius),
//             ),
//           ),

//AnimatedOpacity(
//             duration: Duration(seconds: 2),
//             opacity: mOpacity,
//             child: InkWell(
//               onTap: (){
//                 mOpacity = Random().nextInt(11)/10;
//                 setState(() {
//
//                 });
//               },
//               child: Container(
//                 width: 200,
//                 height: 200,
//                 color: Colors.blue,
//               ),
//             ),
//           )
