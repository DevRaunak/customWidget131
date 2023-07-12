import 'dart:math';

import 'package:flutter/material.dart';

class AnimationBuilderTwoPage extends StatefulWidget {
  const AnimationBuilderTwoPage({Key? key}) : super(key: key);

  @override
  State<AnimationBuilderTwoPage> createState() => _AnimationBuilderTwoPageState();
}

class _AnimationBuilderTwoPageState extends State<AnimationBuilderTwoPage>
    with TickerProviderStateMixin{
  late AnimationController mControllerOne;
  late Animation dropDownTween;

  @override
  void initState() {
    super.initState();

    mControllerOne = AnimationController(vsync: this, duration: Duration(milliseconds: 500  ))
      ..addStatusListener((status) {

      })..repeat();
    /*dropDownTween = Tween(begin: -400.0, end: 0.0).animate(mControllerOne);

    mControllerSecond = AnimationController(vsync: this, duration: Duration(seconds: 2));

    mController = mControllerOne;*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transform'),
        ),
        body: InkWell(
          onTap: (){
            if(mControllerOne.isAnimating){
              mControllerOne.stop();
            } else {
              mControllerOne.repeat();
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
            child: Center(
              child: AnimatedBuilder(
                animation: mControllerOne,
                builder: (ctx, child){
                  return Transform.rotate(
                    angle: 2*pi*mControllerOne.value,
                    child: Icon(
                      Icons.sunny,
                      size: 100,
                      color: Colors.orange,
                    ),
                  );
                },
              ),
            ),
          ),
        )
    );
  }
}
