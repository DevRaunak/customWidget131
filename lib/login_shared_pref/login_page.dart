import 'package:custom_widget_131/login_shared_pref/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../explicit_animations/animation_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.account_balance_wallet, color: Colors.blue,size: 25,),
            SizedBox(height: 11,),
            Text('Welcome back!'),
            SizedBox(height: 11,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Username',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 11,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Password',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 11,),
            ElevatedButton(onPressed: ()async{

              
              
              
              //if user is successfully logged in
              var pref = await SharedPreferences.getInstance();
              pref.setBool(SplashPage.KEY_IS_LOGGED_IN, true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
              
            }, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
