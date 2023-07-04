import 'package:flutter/material.dart';

class UIBase {

  static InputDecoration getCustomDecoration({
    double bRadius = 21.0,
    Color bColor = Colors.blue,
    required String hint,
    required String labelText,
    Color mFillColor = Colors.blue,
    bool isFilled = false,
    IconData? mPrefixIcon,
    IconData? mSuffixIcon,
    VoidCallback? onSuffixIconTap,
  }) {
    return InputDecoration(
      hintText: hint,
      label: Text(labelText),
      fillColor: mFillColor,
      filled: isFilled,
      prefixIcon: mPrefixIcon != null ? Icon(mPrefixIcon) : null,
      suffixIcon: mSuffixIcon !=null ? InkWell(
        onTap: onSuffixIconTap,
          child: Icon(mSuffixIcon)) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(bRadius),
        borderSide: BorderSide(
          color: bColor,
        ),
      )
    );
  }
}