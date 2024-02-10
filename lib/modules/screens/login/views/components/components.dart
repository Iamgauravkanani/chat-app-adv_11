import 'package:flutter/material.dart';

//todo: buttonstyle
myButtonStyle({Color bg_color = Colors.orange}) {
  return ButtonStyle(
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    textStyle: const MaterialStatePropertyAll<TextStyle>(
      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    backgroundColor: MaterialStatePropertyAll(bg_color),
    minimumSize: const MaterialStatePropertyAll(
      Size(350, 50),
    ),
  );
}

//todo:login button click
login() {}

//todo:outline border
OutlineInputBorder outlineInputBorder() => const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );

//todo:labeltextstyle
TextStyle textStyle() => const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
