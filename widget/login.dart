import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shopdata/data/regerstion.dart';
import 'package:shopdata/mordern/dataservice.dart';
import 'package:shopdata/widget/NavigatorService.dart';
import 'package:shopdata/widget/authention.dart';
import 'package:shopdata/widget/registerpage.dart';

class LOginPage extends StatefulWidget {
  const LOginPage({Key? key}) : super(key: key);

  @override
  State<LOginPage> createState() => _LOginPageState();
}

class _LOginPageState extends State<LOginPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  // String? phone, phones;
  late NavigatorService _navigator;
  late Authention _authention;
  late FirebaseAuth _auth;
  DatabaseService _databaseService = DatabaseService();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(seconds: 3)).then((value) {
  //     _setUp().then((value) =>widget.)
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    _navigator = GetIt.instance.get<NavigatorService>();
    _authention = Provider.of<Authention>(context);
    _auth = FirebaseAuth.instance;
    return _buildUi();
  }

  Widget _buildUi() {
    //print(_databaseService.datequl());
    // _databaseService.datequl;
    return Scaffold(
        body:
      
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _loginfrom(),
                  SizedBox(
                    height: 20,
                  ),
                  _button(),
                  _registerlink()
                ]),
          )
        
      
    
    );
  }

  Widget _loginfrom() {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: phone,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'phone'),
            onChanged: (value) {
              // phone = value;
            },
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'phone'),
            onChanged: (value) {
              // phone = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return ElevatedButton(
        onPressed: () {
          _key.currentState!.save();
          try {
            //loginadd();
            FirebaseAuth.instance.signInWithEmailAndPassword(
                email: phone.text, password: password.text);
            print('equal');
          } on FirebaseAuthException {
            print('errorslogin');
          } catch (e) {
            print(e);
            print('object');
          }
        },
        child: Text('Login'));
  }

  Widget _registerlink() {
    return GestureDetector(
      onTap: () {
        _navigator.navigatorPage(RegisterPage());
      },
      child: Text('you don\'t have Account Click'),
    );
  }

  Future<void> loginadd() async {
    // _databaseService.postdata().doc().snapshots().where('phonenumber', isEqualTo: phone);

    // .then((DocumentSnapshot documentSnapshot) {
    //   if(documentSnapshot.exists){}
    // });
  }
}
