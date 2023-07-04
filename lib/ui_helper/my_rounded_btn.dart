import 'package:flutter/material.dart';

class MyRoundedButton extends StatelessWidget {
  String title;
  double mWidth;
  Color mColor;
  double cornerRadius;
  IconData? icon;
  VoidCallback onTap;
  bool isLoading;

  MyRoundedButton({
    required this.title,
    this.mWidth=300,
    this.mColor=Colors.blue,
    this.cornerRadius=21,
    this.icon,
    required this.onTap,
    required this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mWidth,
      child: ElevatedButton(
          onPressed: onTap,
          child: isLoading ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(color: Colors.white,),
              ),
              SizedBox( width: 11,),
              Text('Loading...')
            ],
          ) : icon==null ? Text(title) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(
                width: 11,
              ),
              Text(title),
            ],
          ),
        style: ElevatedButton.styleFrom(
          backgroundColor: mColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          )
        ),
      ),
    );
  }
}
