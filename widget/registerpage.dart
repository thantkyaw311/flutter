import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shopdata/data/regerstion.dart';
import 'package:shopdata/mordern/dataservice.dart';
import 'package:shopdata/widget/NavigatorService.dart';
import 'package:shopdata/widget/authention.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  late DatabaseService _auth;
  late Authention _authention;

  TextEditingController Firstname = TextEditingController();
  TextEditingController lirstname = TextEditingController();
  TextEditingController phonrnumber = TextEditingController();
  TextEditingController passwword = TextEditingController();
  TextEditingController ren_passwword = TextEditingController();
  TextEditingController rephone = TextEditingController();

  bool sent = false;
  bool ok = false;

  late NavigatorService _navigatorService;
  TextEditingController opt = TextEditingController();

  String? FirstName, LastName, phonenumber, password, ren_password;

  @override
  Widget build(BuildContext context) {
    _authention = Provider.of<Authention>(context);
    _navigatorService = GetIt.instance.get<NavigatorService>();
    _auth = GetIt.instance.get<DatabaseService>();

    return Scaffold(
      body: Container(
        //color: Colors.amber,
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Form(
          key: _key,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: Firstname,
                  onSaved: (newValue) {
                    setState(() {
                      FirstName = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lirstname,
                  onSaved: (newValue) {
                    setState(() {
                      LastName = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Last Name',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      Text('null');
                    }
                  },
                  controller: passwword,
                  onSaved: (newValue) {
                    setState(() {
                      password = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {},
                  controller: ren_passwword,
                  onSaved: (r) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'ren-Password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      _navigatorService.navigatorPage(RegisterPhonePage());
                      // sent = true;
                      // _authention.LoginPhone(phonenumber.toString());
                      _key.currentState!.save();
                      _key.currentState!.validate();
                      //AddData();
                      // _auth.postdata().add(RegisterData(
                      //     FirstName: FirstName ?? '',
                      //     LastName: LastName ?? '',
                      //     password: password ?? '',
                      //     phonenumber: phonenumber ?? '',
                      //     ren_Password: ren_password ?? ''));
                    },
                    child: Text('Register'))
              ]),
          // RegisterPhonePage()
        ),
      ),
    );
  }

  Widget OptPgahe() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: opt,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    AddData();
                    _authention.LoginPhone(rephone.text, opt.text);

                    // ConfirmationResult confirmationResult = await FirebaseAuth
                    //     .instance
                    //     .signInWithPhoneNumber('+${rephone.text}');
                    // UserCredential userCredential =
                    //     await confirmationResult.confirm('${opt.text}');
                    // PhoneAuthCredential credential =
                    //     PhoneAuthProvider.credential(
                    //         verificationId: phonenumber!, smsCode: opt.text);
                    // await FirebaseAuth.instance
                    //     .signInWithCredential(credential);
                  },
                  child: Text('Register'))
            ]),
      ),
    );
  }

  Widget RegisterPhonePage() {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: rephone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    sent = true;
                    if (sent == true) {
                      _navigatorService.navigatorPage(OptPgahe());
                    } else {
                      print('routefail');
                    }
                  });

                  // FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: '+66${rephone.text.toString()}',
                  //   //timeout: Duration(seconds: 10),
                  //   verificationCompleted: (vercomple) {},
                  //   verificationFailed: ((error) {
                  //     print(error);
                  //     print('failerro');
                  //   }),
                  //   codeSent: (verification, Token) {
                  //     setState(() {
                  //       sent = true;
                  //       if (sent == true) {
                  //         _navigatorService.navigatorPage(OptPgahe());
                  //       } else {
                  //         print('routefail');
                  //       }
                  //     });
                  //     phonenumber = verification;
                  //     print('smscode');
                  //   },
                  //   codeAutoRetrievalTimeout: (verificationId) {
                  //     phonenumber = verificationId;
                  //     print('timeout');
                  //   },
                  // );
                },
                child: Text('Register'))
          ]),
    ));
  }

  Future<void> AddData() async {
    DatabaseService()
        .postdata
        .call()
        .add(RegisterData(
                FirstName: Firstname.text,
                LastName: lirstname.text,
                password: passwword.text,
                phonenumber: rephone.text,
                ren_Password: ren_passwword.text)
            // RegisterData(Firstname.text, lirstname.text, passwword.text,
            //   phonrnumber.text, ren_passwword.text)
            //FirstName, LastName, password, phonenumber, ren_password
            )
        .then((value) => DatabaseService().postdata())
        .catchError((e) {
      print(e);
    });
  }
}
