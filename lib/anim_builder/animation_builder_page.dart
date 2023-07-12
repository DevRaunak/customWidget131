import 'package:flutter/material.dart';

class AnimationBuilderPage extends StatefulWidget {
  const AnimationBuilderPage({Key? key}) : super(key: key);

  @override
  State<AnimationBuilderPage> createState() => _AnimationBuilderPageState();
}

class _AnimationBuilderPageState extends State<AnimationBuilderPage>
    with TickerProviderStateMixin{
  late AnimationController mControllerOne;
  late AnimationController mControllerSecond;
  late Animation dropDownTween;
  late AnimationController mController;

  @override
  void initState() {
    super.initState();

    mControllerOne = AnimationController(vsync: this, duration: Duration(seconds: 2))..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        mController = mControllerSecond;
        dropDownTween = Tween(begin: 0.0, end: 400.0).animate(mControllerSecond);
        mControllerSecond.forward();
        setState(() {

        });
      }
    })..forward();
    dropDownTween = Tween(begin: -400.0, end: 0.0).animate(mControllerOne);

    mControllerSecond = AnimationController(vsync: this, duration: Duration(seconds: 2));

    mController = mControllerOne;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: mController,
          builder: (ctx, child){
            return Transform.translate(
                offset: mController==mControllerSecond ?
                Offset(dropDownTween.value, -1.0*dropDownTween.value) : Offset(dropDownTween.value, dropDownTween.value),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            );
          },
        ),
      )
    );
  }
}
