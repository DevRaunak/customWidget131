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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late AnimationController mController;
  late Animation tweenAnim;
  late Animation sizeAnim;
  late Animation colorTween;

  @override
  void initState() {
    super.initState();
    //1
    mController = AnimationController(vsync: this, duration: Duration(seconds: 2),);


    //Tween
    tweenAnim = Tween(begin: 11.0, end: 21.0).animate(mController);
    //Tween
    sizeAnim = Tween(begin: 200.0, end: 300.0).animate(mController);

    colorTween = ColorTween(begin: Color(0xffff0000), end: Color(0xff00ff00)).animate(mController);


    //2
    mController.addListener(() {
      print("controller: ${mController.value}");
      print("tween: ${colorTween.value}");
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizeAnim.value,
              height: sizeAnim.value,
              child: Icon(Icons.account_circle_outlined,
                size: sizeAnim.value,
                color: Colors.blue,),
              decoration: BoxDecoration(
                  color: colorTween.value,
                  borderRadius: BorderRadius.circular(tweenAnim.value)
              ),
            ),
            ElevatedButton(onPressed: (){
              //3
              if(mController.isAnimating){
                mController.stop();
              } else {
                mController.forward();
              }

            }, child: Text('Start'))
          ],
        ),
      ),
    );
  }
}



