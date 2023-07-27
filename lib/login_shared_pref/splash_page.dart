import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../explicit_animations/animation_controller.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  static String KEY_IS_LOGGED_IN = "IsLoggedIn";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), ()async{

      var pref = await SharedPreferences.getInstance();
      var check = pref.getBool(SplashPage.KEY_IS_LOGGED_IN) ?? false;

      var map = {
        "vskmvsf":  "vmkfmvf",
        "vskmvsf":  "vmkfmvf",
      };

      pref.setString("Data", map.toString());

        if(check){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: Icon(Icons.account_balance_wallet, color: Colors.white,size: 52,),
        ),
      ),
    );
  }
}
