import 'dart:math';

import 'package:flutter/material.dart';

class AnimationBuilderThirdPage extends StatefulWidget {
  const AnimationBuilderThirdPage({Key? key}) : super(key: key);

  @override
  State<AnimationBuilderThirdPage> createState() => _AnimationBuilderThirdPageState();
}

class _AnimationBuilderThirdPageState extends State<AnimationBuilderThirdPage>
    with TickerProviderStateMixin{
  late AnimationController mControllerOne;
  late Animation scaleTween;

  @override
  void initState() {
    super.initState();

    mControllerOne = AnimationController(vsync: this, duration: Duration(milliseconds: 500  ))
      ..addStatusListener((status) {

      })..repeat(reverse: true);

    scaleTween = Tween(begin: 0.0, end: 4.0).animate(mControllerOne);
    /*dropDownTween = Tween(begin: -400.0, end: 0.0).animate(mControllerOne);

    mControllerSecond = AnimationController(vsync: this, duration: Duration(seconds: 2));

    mController = mControllerOne;*/

  }
  @override
  void dispose() {
    super.dispose();
    mControllerOne.dispose();
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
                  return Transform.scale(
                    scale: scaleTween.value,
                    child: Transform.rotate(
                      angle: pi*mControllerOne.value,
                      child: Icon(
                        Icons.sunny,
                        size: 100,
                        color: Colors.orange,
                      ),
                    )
                  );
                },
              ),
            ),
          ),
        )
    );
  }
}
