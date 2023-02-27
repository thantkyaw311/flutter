import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shopdata/data/regerstion.dart';
import 'package:shopdata/widget/NavigatorService.dart';
import 'package:shopdata/widget/authention.dart';
import 'package:shopdata/widget/bodypage.dart';
import 'package:shopdata/widget/firstscreen.dart';
import 'package:shopdata/widget/login.dart';
import 'package:shopdata/widget/secondscreen.dart';
import 'package:shopdata/widget/splash.dart';

void main() {
  runApp(SplashPage(
      key: UniqueKey(),
      onComplete: () {
        runApp(MyApp());
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(FirebaseAuth.instance.currentUser!.uid);
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Authention>(create: (BuildContext _context) {
          return Authention();
        })
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BodyPage(),)
      //  MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   navigatorKey: NavigatorService.navigatorkey,
      //   initialRoute: '/Login',
      //   routes: {'/Login': ((context) => LOginPage())},
      // ),
    );
  }
}
