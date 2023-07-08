import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String imgUrl;

  DetailPage({required this.imgUrl});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(imgUrl, fit: BoxFit.fill,)),
    );
  }
}
