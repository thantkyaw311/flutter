import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopdata/data/image.dart';
import 'package:shopdata/widget/secondscreen.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool loading = false;
  bool success = false;
  bool error = false;
  File? profilepicture;
  TextEditingController prize = TextEditingController();

  TextEditingController name = TextEditingController();

  //TextEditingController image = TextEditingController();
  //get names => collection;
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('api');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('firstscreen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    hintText: 'name',
                    border: OutlineInputBorder()),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'name',
                    border: OutlineInputBorder()),
                controller: prize,
              ),
              Divider(),
              // TextField(
              //   decoration: InputDecoration(
              //       contentPadding: EdgeInsets.all(20),
              //       hintText: 'name',
              //       border: OutlineInputBorder()),
              //   controller: image,
              // ),
              IconButton(
                  onPressed: () async {
                    File? image = await choseimage();

                    if (image != null) {
                      setState(() {
                        profilepicture = image;
                      });
                    }
                  },
                  icon: Icon(Icons.abc)),
              (profilepicture != null)
                  ? Image.file(
                      profilepicture!,
                      width: 100,
                      height: 100,
                    )
                  : SizedBox(),
              Divider(),
              ElevatedButton(onPressed: addcontent, child: Text('save')),
              (loading) ? CircularProgressIndicator() : SizedBox(),
              (error) ? Text('erroe') : SizedBox(),
              (success) ? Text('data') : SizedBox()
            ],
          ),
        ));
  }

  Future<void> addcontent() async {
    setState(() {
      loading = true;
      success = false;
      error = false;
    });
    //await uplodimage();
    collection.add({'name': name.text, 'prize': prize.text}).then((value) {
      setState(() {
        loading = false;
        success = true;
      });
    }).catchError((e) {
      setState(() {
        loading = false;
        error = true;
      });
    }).whenComplete(() {
      name.text = '';
      prize.text = '';
    });
  }
}
