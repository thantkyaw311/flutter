import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:shopdata/mordern/dataservice.dart';
import 'package:shopdata/widget/NavigatorService.dart';
import 'package:shopdata/widget/authention.dart';
import 'package:shopdata/widget/login.dart';
import 'package:shopdata/widget/secondscreen.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onComplete;
  const SplashPage({required Key? key, required this.onComplete})
      : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
//  NavigatorService _navigatorService = NavigatorService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Future.delayed(Duration(seconds: 2)).then((_) {
          _setUp().then((_) => widget.onComplete());
        });
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.amber,
      ),
    );
  }

  Future<void> _setUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerService();
    // FirebaseAuth.instance.authStateChanges().listen((user) {
    //   if (user != null) {
      
    //    // _navigatorService.removeAndRoute('/Login');
    //     _navigatorService.navigatorPage(SecondScreen());
    //   }
    // });
  }

  void _registerService() {
    GetIt.instance.registerSingleton<NavigatorService>(NavigatorService());

    GetIt.instance.registerSingleton<DatabaseService>(DatabaseService());
  }
}
