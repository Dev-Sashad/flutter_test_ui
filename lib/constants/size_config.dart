import 'package:flutter/material.dart';
//Helps to scale size on different device and maintain UI looks

kwidth(double value, BuildContext context) {// 414 is the default design screen width on figma
  return MediaQuery.of(context).size.width *
      (value / 100); // width size on figma
}

kheight(double value, BuildContext context) { // 896 is the default design screen height on figma
  return MediaQuery.of(context).size.height *
      (value /100); // height size on figma
}

///Text Sizes
double smallest = 10.0;
double smaller = 14.0;
double small =15.0;
double normal = 18.0;
double big = 20;
double bigger = 22;
double biggest = 25;
