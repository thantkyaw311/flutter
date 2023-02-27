import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shopdata/mordern/dataservice.dart';
import 'package:shopdata/widget/NavigatorService.dart';
import 'package:shopdata/widget/bodypage.dart';
import 'package:shopdata/widget/login.dart';
import 'package:shopdata/widget/secondscreen.dart';

class Authention extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final DatabaseService _databaseService;
  late final NavigatorService _navigatorService;
  SecondScreen secondScreen = SecondScreen();
  Authention() {
    _auth = FirebaseAuth.instance;
    _navigatorService = GetIt.instance.get<NavigatorService>();

    _databaseService = GetIt.instance.get<DatabaseService>();
    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        // _databaseService.useuid(_user.uid).then((value) {
        //   value.data();
        //   if (value.data() == _user.uid) {
            
        //   }
        // });

        // .then(
        //   (value) {
        //     value.data();
        //     if (value.data() == _user.uid) {
        //
        //     }
        //   },
        // );
        //var h=_databaseService.useuid(_user.uid);

        // print(h);
        _navigatorService.navigatorPage(BodyPage());
        // print(_auth.currentUser);
        print('object');
      } else {
        _navigatorService.navigatorPage(LOginPage());
        print('Not Auth');
      }
    });
  }
  Future<void> LoginPhone(String phonenumber, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: phonenumber, password: password);
    } on FirebaseAuthException {
      print('error');
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
