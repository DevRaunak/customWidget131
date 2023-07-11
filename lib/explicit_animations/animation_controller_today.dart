import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late AnimationController mController;
  late AnimationController mSecondController;
  late Animation tweenAnim;
  late Animation sizeAnim;
  late Animation colorTween;
  late Animation alignAnim;
  late Animation<Size?> boxAnim;
  var reverseCount = 0;

  @override
  void initState() {
    super.initState();
    //1
    mController = AnimationController(vsync: this, duration: Duration(seconds: 2),)..addListener(() {
      /*print("controller: ${mController.value}");
      print("tween: ${sizeAnim.value}");*/

      setState(() {

      });
    })..addStatusListener((status) {
      print(status);
      if(status==AnimationStatus.reverse){
        reverseCount++;
        if(reverseCount==4) {
          mSecondController.repeat(reverse: true);
        }
      }
    })..repeat(reverse: true);

    mSecondController = AnimationController(vsync: this, duration: Duration(seconds: 2))..addListener(() {
      setState(() {

      });
    });



    //2
    /* mController.addListener(() {


    });*/



    //Tween
    tweenAnim = Tween(begin: 11.0, end: 21.0).animate(mController);
    //Tween
    sizeAnim = Tween(begin: 200.0, end: 300.0).animate(mController);

    colorTween = ColorTween(begin: Color(0xffff0000), end: Color(0xff00ff00)).animate(mSecondController);

    alignAnim = AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight).animate(mController);

    boxAnim = SizeTween(begin: Size(200.0, 100.0), end: Size(100.0, 200.0)).animate(mController);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller'),
      ),
      body: Align(
        alignment: alignAnim.value,
        child: Container(
          width: boxAnim.value!.width,
          height: boxAnim.value!.height,
          decoration: BoxDecoration(
              color: colorTween.value,
              borderRadius: BorderRadius.circular(tweenAnim.value)
          ),
        ),
      ),
    );
  }
}



