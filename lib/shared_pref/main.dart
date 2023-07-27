import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class _HomePageState extends State<HomePage> {
  var _nameController = TextEditingController();
  late SharedPreferences pref;
  String? name;

  @override
  void initState(){
    super.initState();
    getNameFromPref();
  }

  //get
  void getNameFromPref() async {
    pref = await SharedPreferences.getInstance();
    name = pref.getString("Name");
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Pref'),
      ),
      body: Center(
        child:Column(
          children: [
            Text('Name saved: ${name ?? "Default Name"}'),
            TextField(
              controller: _nameController,
            ),
            ElevatedButton(onPressed: () async{

              //set
              //other code which is to be executed after above line

              pref.setString("Name", _nameController.text.toString());

             /* name = _nameController.text.toString();
              setState(() {

              });*/


            }, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
