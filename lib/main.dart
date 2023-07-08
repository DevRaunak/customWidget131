import 'dart:async';

import 'package:custom_widget_131/ui_helper/my_rounded_btn.dart';
import 'package:custom_widget_131/ui_helper/ui_base.dart';
import 'package:custom_widget_131/validator_mixin.dart';
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ValidatorMixin{
  var emailController = TextEditingController();
  var passController = TextEditingController();

  bool isPasswordVisible = false;

  var email = "";

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              /*MyRoundedButton(
                isLoading: false,
                title: 'Play', mColor: Colors.green, cornerRadius: 5, onTap: (){
                print('play button tapped!!');
              },),

              MyRoundedButton(
                isLoading: isLoading,
                onTap: (){
                  isLoading = true;
                  setState(() {

                  });
                  Timer(Duration(seconds: 4),(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Home'),
                      ),
                    ),));
                    }
                  );
              },title: 'Login', icon: Icons.account_circle_outlined,),

              MyRoundedButton(title: "Animate", onTap: (){

              }, isLoading: false, ),
              myButton(),*/

              TextFormField(
                  validator: emailValidate,
                  controller: emailController,
                  onSaved: (value){
                    email = value!;

                  },
                  onChanged: (value) {},
                  decoration: UIBase.getCustomDecoration(
                      hint: "Enter Email here..",
                      labelText: "Email",
                      mPrefixIcon: Icons.account_circle_outlined)),
              SizedBox(
                height: 21,
              ),
              TextFormField(
                  validator: passValidate,
                  controller: passController,
                  obscureText: !isPasswordVisible,
                  obscuringCharacter: "*",
                  onChanged: (value) {},
                  decoration: UIBase.getCustomDecoration(
                      hint: "Enter Pass here..",
                      labelText: "Password",
                      mSuffixIcon: isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixIconTap: () {
                        isPasswordVisible = !isPasswordVisible;
                        setState(() {});
                      })),
              SizedBox(
                height: 21,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  validator: ageValidate,
                  decoration: UIBase.getCustomDecoration(
                    hint: "Enter Age here..",
                    labelText: "Age",
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState != null) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print('Loggin-in');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Text('Home'),
                                ),
                              ),
                            ));
                      }
                    }
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }

  Widget myButton() {
    return ElevatedButton(onPressed: () {}, child: Text('Play'));
  }

  bool isLoading = false;
}
