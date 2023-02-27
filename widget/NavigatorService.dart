import 'package:flutter/material.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorkey =
      new GlobalKey<NavigatorState>();
  void removeAndRoute(String _route) {
    navigatorkey.currentState?.pop();
   // navigatorkey.currentState?.push(_route);
  }
  void navigatorPage(Widget page){
    navigatorkey.currentState?.push(MaterialPageRoute(builder: (BuildContext _context)=>page));

  }
}
