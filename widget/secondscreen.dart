import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopdata/mordern/dataservice.dart';
import 'package:shopdata/profile/Classswidget.dart';
import 'package:shopdata/responsivefile/routepage.dart';
import 'package:shopdata/widget/NavigatorService.dart';
import 'package:shopdata/widget/authention.dart';

import '../data/regerstion.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //Authention _auth = Authention();
  NavigatorService _navigatorService = NavigatorService();
  DatabaseService _databaseService = DatabaseService();
  route r = route();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          title: Container(
            //  padding: EdgeInsets.only(top: 10, left: 5),
            height: 40,
            child: TextFormField(
                showCursor: true,
                //scrollPadding: EdgeInsets.all(50),
                //textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, top: 20),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)))),
          ),
          //centerTitle: true,
          actions: [
            IconButton(
              color: Colors.blue,
              icon: Icon(Icons.login),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
        body:
            // imageslide()
            SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              imageslide(),
              SizedBox(
                height: 20,
              ),
              itemPage()
            ],
          ),
        ));
  }

  // Widget setting() {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Setting')),
  //     body: StreamBuilder<QuerySnapshot<RegisterData>>(
  //       stream: _databaseService.getdata(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           List<QueryDocumentSnapshot<RegisterData>> get = snapshot.data!.docs;
  //           return ListView.builder(
  //               itemCount: get.length,
  //               itemBuilder: ((context, index) {
  //                 QueryDocumentSnapshot<RegisterData> indeget = get[index];
  //                 return Container(
  //                   child: Column(
  //                     children: [
  //                       Center(
  //                         child: Column(
  //                           children: [
  //                             Padding(
  //                               padding:
  //                                   const EdgeInsets.only(top: 40, bottom: 20),
  //                               child: CircleAvatar(
  //                                 radius: 50,
  //                               ),
  //                             ),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               children: [
  //                                 Text(indeget.data().FirstName ?? ''),
  //                                 SizedBox(
  //                                   width: 10,
  //                                 ),
  //                                 Text(indeget.data().LastName ?? '')
  //                               ],
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                             Text(indeget.data().phonenumber ?? '')
  //                           ],
  //                         ),
  //                       ),

  //                       GestureDetector(
  //                         onTap: () {
  //                           _navigatorService.navigatorPage(Profile()
  //                               .phoneEdite(indeget.data().phonenumber ?? ''));
  //                         },
  //                         child: ListTile(
  //                           leading: Icon(Icons.settings),
  //                           title: Text('Profile'),
  //                         ),
  //                       ),
  //                       // GestureDetector(
  //                       //   child: ListTile(
  //                       //     leading: Icon(Icons.settings),
  //                       //     title: Text('Profile'),
  //                       //   ),
  //                       // ),
  //                       GestureDetector(
  //                         child: ListTile(
  //                           leading: Icon(Icons.wechat),
  //                           title: Text('FAQ & Help'),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               }));
  //           print('hasdata');
  //         } else if (snapshot.hasError) {
  //           print('has erro');
  //         }
  //         return Container();
  //       },
  //     ),
  //   );
}
