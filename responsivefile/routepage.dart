

import 'package:flutter/material.dart';
import 'package:shopdata/widget/login.dart';
import 'package:shopdata/widget/secondscreen.dart';

class route {
  List<Map<String,dynamic>> r = [
   {
     'login':((context)=>SecondScreen()),
     'l':((context)=>LOginPage())
   }
    
  ];
}
